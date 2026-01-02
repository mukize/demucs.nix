{
  buildPythonPackage,
  fetchPypi,
  treetable,
  retrying,
  torch,
  hydra-core,
  pytorch-lightning,
  submitit,
}:
buildPythonPackage rec {
  pname = "dora-search";
  version = "0.1.12";
  format = "setuptools";
  src = fetchPypi {
    pname = "dora_search";
    inherit version;
    hash = "sha256-KVb9LEx+S5pIMOg/DUz5Yb5Fz7oaLwVwKB6R0VrFFvs=";
  };

  propagatedBuildInputs = [
    hydra-core
    pytorch-lightning
    torch
    retrying
    treetable
    submitit
  ];
}
