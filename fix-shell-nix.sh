# first argument used as list of extraLibraries
if [ ! -z $1 ]; then
    perl -0pse 's/(buildDepends.*\];)/\1\n  extraLibraries = with import \<nixpkgs\> {}; \[ $arg \];/s' -- -arg=$1;
else
    cat;
fi | \
perl -0pe 's/^{.*}:/{ haskellPackages ? (import <nixpkgs> {}).haskellPackages }:/s' | \
sed 's/^cabal/with haskellPackages; cabal/' | \
sed 's/sha256 = .*;/src = ".\/.";/' | \
perl -0pe 's/(\s+buildDepends)/\n  buildTools = \[ cabalInstall \];\1/s'

