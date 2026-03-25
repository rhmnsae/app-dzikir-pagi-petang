// gen_notif_icon.js
// Generates a white monochrome notification icon from logo.png using sharp
// Run: node gen_notif_icon.js

const sharp = require('sharp');
const fs = require('fs');
const path = require('path');

const inputPath = path.join(__dirname, 'logo_dzikir.png');
const outputDrawable = path.join(__dirname, 'android/app/src/main/res/drawable/ic_notification.png');
const outputDrawableV21 = path.join(__dirname, 'android/app/src/main/res/drawable-v21/ic_notification.png');

async function generateNotifIcon(outputPath, size) {
  await sharp(inputPath)
    .resize(size, size, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .greyscale()
    .threshold(128)
    .png()
    .toBuffer()
    .then(async (buf) => {
      // Make all non-transparent pixels white
      const img = sharp(buf);
      const { data, info } = await img.raw().toBuffer({ resolveWithObject: true });
      const rawData = Buffer.from(data);
      for (let i = 0; i < rawData.length; i += info.channels) {
        const alpha = info.channels === 4 ? rawData[i + 3] : 255;
        if (alpha > 0) {
          rawData[i] = 255;     // R
          rawData[i + 1] = 255; // G
          rawData[i + 2] = 255; // B
          if (info.channels === 4) rawData[i + 3] = 255; // A
        }
      }
      await sharp(rawData, {
        raw: { width: info.width, height: info.height, channels: info.channels }
      })
        .png()
        .toFile(outputPath);
      console.log('Generated:', outputPath);
    });
}

(async () => {
  await generateNotifIcon(outputDrawable, 96);
  await generateNotifIcon(outputDrawableV21, 96);
})();
