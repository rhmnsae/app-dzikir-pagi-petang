const Hero = () => {
  return (
    <section className="hero-section">
      <div className="container hero-inner">
        <div className="hero-kicker">Aplikasi ibadah harian</div>

        <h1>Dzikir Pagi & Petang</h1>

        <p className="hero-copy">
          Rutinitas dzikir, doa, jadwal shalat, kiblat, dan tasbih digital
          dalam satu tampilan yang bersih, tegas, dan mudah dipakai setiap hari.
        </p>

        <div className="hero-actions">
          <a href="#download" className="btn btn-primary">
            Unduh APK
          </a>
          <a href="#features" className="btn btn-secondary">
            Lihat Fitur
          </a>
        </div>

        <div className="hero-meta" aria-label="Ringkasan aplikasi">
          <div>
            <strong>Offline</strong>
            <span>Tanpa iklan</span>
          </div>
          <div>
            <strong>Android</strong>
            <span>APK terbuka</span>
          </div>
          <div>
            <strong>Lengkap</strong>
            <span>Dzikir & doa</span>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;
