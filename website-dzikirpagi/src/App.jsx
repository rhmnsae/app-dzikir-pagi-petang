import { useEffect } from 'react';
import Hero from './components/Hero';
import Features from './components/Features';
import Preview from './components/Preview';
import Support from './components/Support';
import Download from './components/Download';
import Footer from './components/Footer';
import logo from './assets/logo.svg';
import {
  cleanSectionHashOnLoad,
  scrollToDownload,
  scrollToFeatures,
  scrollToPreview,
  scrollToSupport,
} from './utils/scrollToDownload';

function App() {
  useEffect(() => {
    cleanSectionHashOnLoad();
  }, []);

  return (
    <>
      <nav className="site-nav" aria-label="Navigasi utama">
        <div className="container nav-inner">
          <a className="brand" href="#top" aria-label="Dzikir Pagi dan Petang">
            <img className="brand-logo" src={logo} alt="" aria-hidden="true" />
            <span>Dzikir Pagi Petang</span>
          </a>

          <div className="nav-links">
            <a href="/features" onClick={scrollToFeatures}>Fitur</a>
            <a href="/preview" onClick={scrollToPreview}>Preview</a>
            <a href="/support" onClick={scrollToSupport}>Support</a>
            <a
              href="/download"
              onClick={scrollToDownload}
            >
              Unduh
            </a>
          </div>
        </div>
      </nav>

      <main id="top">
        <Hero />
        <Features />
        <Preview />
        <Support />
        <Download />
      </main>

      <Footer />
    </>
  );
}

export default App;
