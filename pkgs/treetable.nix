{
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:
buildPythonPackage rec {
  pname = "treetable";
  version = "0.2.6";
  format = "pyproject";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fh1i285QP78kVhruFGG4+8wsIy/0VmHDudDCCBx5W98=";
  };

  nativeBuildInputs = [
    setuptools
  ];
}
