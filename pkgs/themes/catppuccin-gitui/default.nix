{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-gitui";
  version = "unstable-2024-03-30";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "gitui";
    rev = "39978362b2c88b636cacd55b65d2f05c45a47eb9";
    hash = "";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r * $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Soothing pastel theme for Helix";
    homepage = "https://github.com/catppuccin/helix";
    license = licenses.mit;
    maintainers = with maintainers; [];
    mainProgram = "helix";
    platforms = platforms.all;
  };
}
