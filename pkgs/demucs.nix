{
  buildPythonPackage,
  lib,
  tqdm,
  torchaudio,
  torch,
  pyyaml,
  lameenc,
  einops,
  julius,
  dora-search,
  openunmix,
  fetchPypi,
}:
buildPythonPackage rec {
  pname = "demucs";
  version = "4.0.1";
  format = "setuptools";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5FpaeIuueXZ8N7v25pquA4Yt3MoFVQ+3m5JjRqF31xM=";
  };

  propagatedBuildInputs = [
    openunmix
    dora-search
    lameenc

    julius
    einops
    pyyaml
    torch
    torchaudio
    tqdm
  ];

  meta = {
    description = "Music source separation";
    homepage = "https://github.com/adefossez/demucs";
    # license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ mukize ];
    mainProgram = "demucs";
  };
}
