let
    nixpkgs = import <nixpkgs> {};
    pkgs-src = nixpkgs.fetchFromGitHub {
        owner = "nixos";
        repo = "nixpkgs";
        rev = "120b013e0c082d58a5712cde0a7371ae8b25a601";
        sha256 = "0hk4y2vkgm1qadpsm4b0q1vxq889jhxzjx3ragybrlwwg54mzp4f";
    };
    pkgs = import pkgs-src {};
in
  pkgs.dockerTools.buildImage {
    name = "carlsverre/docker-toolkit";

    contents = with pkgs; [
      bc
      bash
      coreutils
      procps
      lsof
      curl
      ipcalc
      nmap
      tcpdump
      wget
      dnsutils
      traceroute
    ];

    config = {
      Cmd = [ "${pkgs.bash.out}/bin/bash" ];
    };
  }
