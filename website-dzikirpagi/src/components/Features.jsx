const Features = () => {
  const features = [
    { id: '01', title: 'Dzikir Pagi & Petang', desc: 'Panduan dzikir dengan teks Arab, Latin, dan terjemahan yang nyaman dibaca.' },
    { id: '02', title: 'Jadwal Shalat', desc: 'Waktu shalat harian tersusun rapi sesuai lokasi perangkat.' },
    { id: '03', title: 'Arah Kiblat', desc: 'Kompas kiblat yang langsung terlihat dan mudah dipahami.' },
    { id: '04', title: 'Tasbih Digital', desc: 'Penghitung dzikir praktis dengan ritme interaksi yang sederhana.' },
    { id: '05', title: 'Doa Harian & Nabi', desc: 'Kumpulan doa pilihan untuk aktivitas harian dan doa para Nabi.' },
    { id: '06', title: 'Asmaul Husna', desc: 'Daftar 99 nama Allah beserta makna dalam tampilan yang tertata.' },
    { id: '07', title: 'Kalender Islam', desc: 'Kalender Hijriah untuk melihat tanggal dan momentum penting.' },
    { id: '08', title: 'Mode Luring', desc: 'Konten inti tetap dapat diakses tanpa internet dan tanpa iklan.' },
  ];

  return (
    <section className="section features-section" id="features">
      <div className="container">
        <div className="section-heading">
          <span className="eyebrow">Fitur inti</span>
          <h2>Lengkap, rapi, tidak berisik.</h2>
        </div>

        <div className="feature-grid">
          {features.map((feat) => (
            <article key={feat.id} className="feature-card">
              <span className="feature-id">{feat.id}</span>
              <h3>{feat.title}</h3>
              <p>{feat.desc}</p>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Features;
