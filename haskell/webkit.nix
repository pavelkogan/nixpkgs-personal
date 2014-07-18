{ cabal, cairo, glib, gtk, gtk2hsBuildtools, mtl, pango, webkit }:

cabal.mkDerivation (self: {
  pname = "webkit";
  version = "0.12.6.1";
  sha256 = "1djnzmvsp1wxxsi59ry4s8vrjdrgc0m404n9dcd2ya2zfwhijkka";
  buildDepends = [ cairo glib gtk mtl pango ];
  buildTools = [ gtk2hsBuildtools ];
  pkgconfigDepends = [ webkit ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the Webkit library";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
