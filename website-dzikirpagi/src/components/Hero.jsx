import {
  scrollToFeatures,
} from '../utils/scrollToDownload';
import { apkDownloadUrl, githubReleasesUrl } from '../utils/downloadLinks';

const Hero = () => {
  return (
    <section className="hero-section">
      <div className="container hero-inner">
        <div className="hero-content">
          <div className="hero-kicker">Website resmi aplikasi</div>

          <h1>Dzikir Pagi & Petang</h1>

          <p className="hero-copy">
            Rutinitas dzikir, doa, jadwal shalat, kiblat, dan tasbih digital
            dalam satu tampilan yang bersih, tegas, dan mudah dipakai setiap hari.
            Website ini didukung oleh MUTATIT untuk informasi, preview, dan akses
            unduhan resmi.
          </p>

          <div className="hero-actions">
            <a
              href={apkDownloadUrl}
              className="btn btn-primary"
            >
              Download Langsung
            </a>
            <a
              href={githubReleasesUrl}
              target="_blank"
              rel="noreferrer"
              className="btn btn-secondary"
            >
              GitHub
            </a>
            <a
              href="/features"
              onClick={scrollToFeatures}
              className="btn btn-secondary"
            >
              Lihat Fitur
            </a>
          </div>

          <div className="hero-meta" aria-label="Ringkasan aplikasi">
            <div>
              <strong>Offline</strong>
              <span>Tanpa iklan</span>
            </div>
            <div>
              <strong>Resmi</strong>
              <span>Rilis jelas</span>
            </div>
            <div>
              <strong>MUTATIT</strong>
              <span>Support web</span>
            </div>
          </div>
        </div>

        <div className="hero-visual" aria-hidden="true">
          <div className="hero-phone-card">
            <div className="hero-phone-bar">
              <span>01</span>
              <span>Beranda</span>
            </div>
            <img
              className="hero-phone-image"
              src="/1-beranda.jpeg"
              alt=""
            />
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;
