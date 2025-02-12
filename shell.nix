{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    git
    git-lfs
    python312
  ];

  # Optional: Define the shell prompt with the current project directory
  shellHook = ''
    alias docs="sh docs.sh"
    alias clean="make clean"
    alias update="make update"
    alias sync="make sync"
    alias install="make install"
    alias reinstall="make reinstall"
  '';
}