import logo from '../assets/logo.svg';

const Footer = () => {
  return (
    <footer className="site-footer">
      <div className="container footer-inner">
        <div className="footer-brand">
          <img className="brand-logo" src={logo} alt="" aria-hidden="true" />
          <h3>Dzikir Pagi & Petang</h3>
          <p>Aplikasi simpel untuk menjaga rutinitas ibadah harian.</p>
        </div>

        <div className="footer-menu">
          <div className="footer-nav">
            <span>Navigasi</span>
            <div className="footer-links">
              <a href="#features">Fitur</a>
              <a href="#preview">Preview</a>
              <a href="#download">Unduh</a>
            </div>
          </div>
        </div>
      </div>

      <div className="container footer-bottom">
        <p className="copyright">
          &copy; {new Date().getFullYear()} Hak Cipta Dilindungi.
        </p>
        <span>Dzikir Pagi & Petang</span>
      </div>
    </footer>
  );
};

export default Footer;
