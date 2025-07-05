{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    git
    git-lfs
    treefmt
    nixpkgs-fmt
    nodePackages.prettier
    xmlstarlet
  ];

  # Optional: Define the shell prompt with the current project directory
  shellHook = ''
    alias update="make update"
    alias install="make install"
  '';
}
