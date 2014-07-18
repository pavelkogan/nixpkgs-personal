{ cabal, Cabal, fgl, filepath, Graphalyze, graphviz, haskellSrcExts
, mtl, multiset, random
}:

cabal.mkDerivation (self: {
  pname = "SourceGraph";
  version = "0.7.0.6";
  sha256 = "03psglm6xyqvcgnbimidafy51kwpipk5q6s8ip5vhjm2d5makkhm";
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    Cabal fgl filepath Graphalyze graphviz haskellSrcExts mtl multiset
    random
  ];
  meta = {
    description = "Static code analysis using graph-theoretic techniques";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
  };
})
