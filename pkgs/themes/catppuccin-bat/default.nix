{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-bat";
  version = "unstable-2024-03-30";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "b19bea35a85a32294ac4732cad5b0dc6495bed32";
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
    mainProgram = "bat";
    platforms = platforms.all;
  };
}
