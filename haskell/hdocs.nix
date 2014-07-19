# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, aeson, aesonPretty, filepath, ghcPaths, haddock
, MonadCatchIOTransformers, mtl, network, text, transformers
}:

cabal.mkDerivation (self: {
  pname = "hdocs";
  version = "0.4.0.3";
  sha256 = "0i7xw3w8qy8ak5wzz589nmf04mk59m239s3qdswh607birpl0k9a";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    aeson aesonPretty filepath ghcPaths haddock
    MonadCatchIOTransformers mtl network text transformers
  ];
  testDepends = [ mtl ];
  meta = {
    homepage = "https://github.com/mvoidex/hdocs";
    description = "Haskell docs tool";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
