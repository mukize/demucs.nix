{
  buildPythonPackage,
  fetchPypi,
  wheel,
  setuptools,
  cython,
}:
buildPythonPackage rec {
  pname = "diffq";
  version = "0.2.4";
  format = "setuptools";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BJBkhh6XTr8A0LrauLMkx3UDc3FBntoxUJhbnUd7W9I=";
  };

  propagatedBuildInputs = [
    cython
    setuptools
    wheel
  ];

}
