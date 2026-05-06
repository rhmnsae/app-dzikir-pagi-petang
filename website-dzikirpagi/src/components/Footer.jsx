const Footer = () => {
  return (
    <footer className="site-footer">
      <div className="container footer-inner">
        <div className="footer-brand">
          <h3>Dzikir Pagi & Petang</h3>
          <p>
            Website utama aplikasi Dzikir Pagi & Petang.
          </p>
        </div>
      </div>

      <div className="container footer-bottom">
        <p className="copyright">
          &copy; {new Date().getFullYear()} Hak Cipta Dilindungi.
        </p>
      </div>
    </footer>
  );
};

export default Footer;
