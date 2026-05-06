const Support = () => {
  return (
    <section className="section support-section" id="support">
      <div className="container support-layout">
        <div className="support-copy">
          <span className="eyebrow">Support website</span>
          <h2>Didukung oleh MUTATIT.</h2>
          <p>
            Website ini menjadi halaman utama untuk memperkenalkan aplikasi,
            menampilkan preview layar, dan mengarahkan pengguna ke sumber unduhan
            resmi. Dukungan web dan platform disediakan oleh MUTATIT.
          </p>
        </div>

        <div className="support-card">
          <div>
            <span className="support-label">Platform support</span>
            <strong>MUTATIT</strong>
          </div>
          <p>
            Kunjungi website MUTATIT untuk melihat layanan, tools website, dan
            dukungan pengembangan digital lainnya.
          </p>
          <a
            className="btn btn-primary support-button"
            href="https://mutatit.com/"
            target="_blank"
            rel="noreferrer"
          >
            Buka mutatit.com
          </a>
        </div>
      </div>
    </section>
  );
};

export default Support;
