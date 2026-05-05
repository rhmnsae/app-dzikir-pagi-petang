import { useEffect, useState } from 'react';

const screens = [
  { title: 'Beranda', meta: 'Ringkasan ibadah', image: '/1-beranda.jpeg' },
  { title: 'Dzikir Pagi', meta: 'Arab, latin, arti', image: '/2-dzikirpagi.jpeg' },
  { title: 'Dzikir Petang', meta: 'Urutan bacaan', image: '/3-dzikirpetang.jpeg' },
  { title: 'Jadwal Shalat', meta: 'Waktu harian', image: '/4-jadwalshalat.jpeg' },
  { title: 'Arah Kiblat', meta: 'Kompas ringkas', image: '/5-arahkiblat.jpeg' },
  { title: 'Tasbih Digital', meta: 'Hitung dzikir', image: '/6-tasbih.jpeg' },
  { title: 'Doa Harian', meta: 'Koleksi doa', image: '/7-doaharian.jpeg' },
  { title: 'Doa Nabi', meta: 'Koleksi doa nabi', image: '/8-doanabi.jpeg' },
  { title: 'Kalender Islam', meta: 'Tanggal Hijriah', image: '/9-kalender.jpeg' },
  { title: 'Pengaturan', meta: 'Mode nyaman', image: '/10-pengaturan.jpeg' },
];

const Preview = () => {
  const [activeIndex, setActiveIndex] = useState(null);

  const activeScreen = activeIndex === null ? null : screens[activeIndex];
  const closePreview = () => setActiveIndex(null);
  const showPrevious = () => {
    setActiveIndex((current) => (current === null ? null : (current + screens.length - 1) % screens.length));
  };
  const showNext = () => {
    setActiveIndex((current) => (current === null ? null : (current + 1) % screens.length));
  };

  useEffect(() => {
    if (activeIndex === null) {
      return undefined;
    }

    const handleKeyDown = (event) => {
      if (event.key === 'Escape') {
        setActiveIndex(null);
      }

      if (event.key === 'ArrowLeft') {
        setActiveIndex((current) => (current === null ? null : (current + screens.length - 1) % screens.length));
      }

      if (event.key === 'ArrowRight') {
        setActiveIndex((current) => (current === null ? null : (current + 1) % screens.length));
      }
    };

    document.body.classList.add('modal-open');
    window.addEventListener('keydown', handleKeyDown);

    return () => {
      document.body.classList.remove('modal-open');
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, [activeIndex]);

  return (
    <section className="section preview-section" id="preview">
      <div className="container">
        <div className="section-heading preview-heading">
          <span className="eyebrow">Preview aplikasi</span>
          <h2>10 tampilan utama aplikasi.</h2>
          <p>
            Gambaran layar dibuat bersih agar fitur utama mudah dipahami sebelum
            aplikasi diunduh.
          </p>
        </div>

        <div className="preview-grid" aria-label="Preview tampilan aplikasi">
          {screens.map((screen, index) => (
            <button
              className="preview-card"
              key={screen.title}
              type="button"
              onClick={() => setActiveIndex(index)}
              aria-label={`Lihat detail tampilan ${screen.title}`}
            >
              <div className="preview-phone">
                <div className="phone-status">
                  <span>{String(index + 1).padStart(2, '0')}</span>
                  <span>DP</span>
                </div>
                <img
                  className="preview-image"
                  src={screen.image}
                  alt={`Tampilan ${screen.title} aplikasi Dzikir Pagi dan Petang`}
                />
              </div>
              <div className="preview-caption">
                <span className="preview-index">
                  Tampilan {String(index + 1).padStart(2, '0')}
                </span>
                <h3>{screen.title}</h3>
                <p>{screen.meta}</p>
              </div>
            </button>
          ))}
        </div>
      </div>

      {activeScreen && (
        <div className="preview-modal" role="dialog" aria-modal="true" aria-label={`Detail ${activeScreen.title}`}>
          <button className="preview-modal-backdrop" type="button" onClick={closePreview} aria-label="Tutup preview" />
          <div className="preview-modal-panel">
            <div className="preview-modal-head">
              <div>
                <span>Tampilan {String(activeIndex + 1).padStart(2, '0')}</span>
                <h3>{activeScreen.title}</h3>
              </div>
              <button className="preview-modal-close" type="button" onClick={closePreview} aria-label="Tutup preview">
                X
              </button>
            </div>

            <div className="preview-modal-image-wrap">
              <img
                className="preview-modal-image"
                src={activeScreen.image}
                alt={`Detail tampilan ${activeScreen.title} aplikasi Dzikir Pagi dan Petang`}
              />
            </div>

            <div className="preview-modal-actions">
              <button type="button" onClick={showPrevious} aria-label="Tampilan sebelumnya">
                &lt;
              </button>
              <p>{activeScreen.meta}</p>
              <button type="button" onClick={showNext} aria-label="Tampilan berikutnya">
                &gt;
              </button>
            </div>
          </div>
        </div>
      )}
    </section>
  );
};

export default Preview;
