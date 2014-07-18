{ cabal, bktrees, fgl, filepath, graphviz, pandoc, random, text
, time
}:

cabal.mkDerivation (self: {
  pname = "Graphalyze";
  version = "0.14.1.0";
  sha256 = "0pyrhpl06lsppr8ch21crinkax7fh0k18wfvgjinc8phkk6j5hz3";
  buildDepends = [
    bktrees fgl filepath graphviz pandoc random text time
  ];
  meta = {
    description = "Graph-Theoretic Analysis library";
    license = "unknown";
    platforms = self.ghc.meta.platforms;
  };
})
