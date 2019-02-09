let
    nixpkgs = import <nixpkgs> {};
    pkgs-src = nixpkgs.fetchFromGitHub {
        owner = "nixos";
        repo = "nixpkgs";
        rev = "e50e323a2c4257bf0c505ec6f61cd5d1fd39b106";
        sha256 = "0z6hpjvlp2g4zkc82w28hgj40dfpncxy1w1f4fxvxxwplx3crspp";
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
      tcpdump
      iproute
    ];

    config = {
      Cmd = [ "${pkgs.bash.out}/bin/bash" ];
    };
  }
