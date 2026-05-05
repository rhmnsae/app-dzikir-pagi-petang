import Hero from './components/Hero';
import Features from './components/Features';
import Preview from './components/Preview';
import Download from './components/Download';
import Footer from './components/Footer';
import logo from './assets/logo.svg';

function App() {
  return (
    <>
      <nav className="site-nav" aria-label="Navigasi utama">
        <div className="container nav-inner">
          <a className="brand" href="#top" aria-label="Dzikir Pagi dan Petang">
            <img className="brand-logo" src={logo} alt="" aria-hidden="true" />
            <span>Dzikir Pagi & Petang</span>
          </a>

          <div className="nav-links">
            <a href="#features">Fitur</a>
            <a href="#preview">Preview</a>
            <a href="#download">Unduh</a>
          </div>
        </div>
      </nav>

      <main id="top">
        <Hero />
        <Features />
        <Preview />
        <Download />
      </main>

      <Footer />
    </>
  );
}

export default App;
