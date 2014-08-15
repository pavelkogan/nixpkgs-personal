{ cabal, errors, glib, gtk, mtl, reactiveBanana }:

cabal.mkDerivation (self: {
  pname = "reactive-banana-gtk";
  version = "0.0.4";
  src = /home/pavel/work/reactive-banana-gtk;
  buildDepends = [ errors glib gtk mtl reactiveBanana ];
  meta = {
    description = "reactive-banana binding to GTK+";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
