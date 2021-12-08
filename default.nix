{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  pname   = "st";
  version = "1.0.0";

  src = ./.;

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    fontconfig
    harfbuzz
    xorg.libX11
    xorg.libXext
    xorg.libXft
    ncurses
  ];

  installPhase = ''
    runHook preInstall

    TERMINFO=$out/share/terminfo make install PREFIX=$out

    runHook postInstall
  '';
}
