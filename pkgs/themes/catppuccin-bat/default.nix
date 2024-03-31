{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "catppuccin-bat";
  version = "unstable-2024-03-30";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "b19bea35a85a32294ac4732cad5b0dc6495bed32";
    hash = "sha256-POoW2sEM6jiymbb+W/9DKIjDM1Buu1HAmrNP0yC2JPg=";
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
