{ cabal, conduit, dataDefault, fgl, graphviz, gtk, mtl, parsec
, reactiveBanana, reactiveBananaGtk, safe, strict, text
, transformers, webkit, xmlConduit, xmlConduitWriter, xmlTypes
}:

cabal.mkDerivation (self: {
  pname = "neuroSpider";
  version = "0.0.1";
  src = "/home/pavel/work/NeuroSpider";
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    conduit dataDefault fgl graphviz gtk mtl parsec reactiveBanana
    reactiveBananaGtk safe strict text transformers webkit xmlConduit
    xmlConduitWriter xmlTypes
  ];
  meta = {
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
