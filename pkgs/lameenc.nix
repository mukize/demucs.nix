{
  buildPythonPackage,
  fetchPypi,
}:
buildPythonPackage rec {
  pname = "lameenc";
  version = "1.8.1";
  format = "wheel";
  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    dist = "cp313";
    abi = "cp313";
    python = "cp313";
    platform = "manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_28_x86_64";
    hash = "sha256-A5n33sfI1ibJEwI6PHy9iTFNq28OZ6xKM1pKTLjCPeM=";
  };
}
