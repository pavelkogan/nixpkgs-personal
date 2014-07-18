{ cabal }:

cabal.mkDerivation (self: {
  pname = "base-prelude";
  version = "0.1.1";
  sha256 = "09zimfirzc6zlhany34ds3jazxjr5fbyjpqcp3ygvr22h41i1ga7";
  meta = {
    homepage = "https://github.com/nikita-volkov/base-prelude";
    description = "The most complete prelude formed from only the \"base\" package";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
