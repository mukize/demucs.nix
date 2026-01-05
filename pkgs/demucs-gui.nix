{
  autoPatchelfHook,
  fetchFromGitHub,
  buildPythonApplication,
  demucs-unstable,
  numpy,
  psutil,
  pyperclip,
  pyside6,
  soundfile,
  soxr,
  packaging,
  ordered-set,
  certifi,
  diffq,
  more-itertools,
  tinytag,
  ninja,
  pyqt6,
  makeWrapper,
  lib,
  ffmpeg,
  python,
}:
buildPythonApplication rec {
  name = "demucs-gui";
  version = "1.3.2";
  format = "other";

  src = fetchFromGitHub {
    owner = "carlgao4";
    repo = "demucs-gui";
    rev = "${version}";
    sha256 = "sha256-PR0ogcU5KjiU6JDjHJwN4WzI9AmkWe63p3OfIBZvSIk=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    autoPatchelfHook
    ninja
    makeWrapper
  ];

  propagatedBuildInputs = [
    demucs-unstable
    pyqt6
    numpy
    psutil
    pyperclip
    pyside6
    soundfile
    soxr
    packaging
    ordered-set
    certifi
    diffq
    more-itertools
    tinytag
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share
    ls -l
    cp -r ./GUI/* $out/share
    cp -r fonts $out/share
    cp -r icon $out/share

    makeWrapper ${(python.withPackages (_: propagatedBuildInputs)).interpreter} $out/bin/demucs-gui \
      --add-flags "$out/share/GuiMain.py" \
      --prefix PATH : ${lib.makeBinPath [ ffmpeg ]}

    runHook postInstall
  '';

  meta = with lib; {
    description = "A simple GUI for Demucs";
    homepage = "https://github.com/carlgao4/demucs-gui";
    license = licenses.gpl3;
    maintainers = with maintainers; [ mukiz ];
    platforms = platforms.linux;
    mainProgram = "demucs-gui";
  };
}
