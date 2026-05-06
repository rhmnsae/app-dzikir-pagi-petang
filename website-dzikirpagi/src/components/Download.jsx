import { apkDownloadUrl, githubReleasesUrl } from '../utils/downloadLinks';

const Download = () => {
  return (
    <section className="section download-section" id="download">
      <div className="container download-layout">
        <div className="download-copy">
          <span className="eyebrow eyebrow-invert">Rilis terbuka</span>
          <h2>Dapatkan aplikasi resmi.</h2>
          <p>
            APK didistribusikan langsung melalui GitHub agar sumber rilisnya
            jelas, mudah dicek, dan tetap bebas dari lapisan yang tidak perlu.
            Halaman website dan informasi dukungan dikelola bersama MUTATIT.
          </p>
        </div>

        <div className="download-card">
          <div className="download-card-head">
            <span>Versi terbaru</span>
            <strong>Android APK</strong>
          </div>

          <ol className="install-steps">
            <li>Unduh file APK dari halaman rilis GitHub.</li>
            <li>Izinkan pemasangan dari sumber yang dipercaya.</li>
            <li>Instal aplikasi dan mulai gunakan.</li>
          </ol>

          <a
            href={apkDownloadUrl}
            className="btn btn-invert download-button"
          >
            Download APK Langsung
          </a>

          <a
            href={githubReleasesUrl}
            target="_blank"
            rel="noreferrer"
            className="download-support-link"
          >
            Lihat halaman rilis GitHub
          </a>
        </div>
      </div>
    </section>
  );
};

export default Download;
