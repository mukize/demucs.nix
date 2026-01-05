{
  fetchFromGitHub,
  demucs,
}:
demucs.overrideAttrs (old: {
  version = "4.1.0a";
  src = fetchFromGitHub {
    owner = "adefossez";
    repo = "demucs";
    rev = "b9ab48cad45976ba42b2ff17b229c071f0df9390";
    sha256 = "sha256-FkN7wIiO6xSYoAQBQHdxY92fV+1q3dvUPQu//oqhRhc=";
  };
})
