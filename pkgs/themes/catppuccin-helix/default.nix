{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-helix";
  version = "unstable-2024-03-30";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "helix";
    rev = "0164c4ca888084df4f511da22c6a0a664b5061d2";
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
