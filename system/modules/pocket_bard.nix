{ 
  lib, stdenv, fetchurl, autoPatchelfHook, patchelf,
  alsa-lib, fontconfig, libGL, zlib, giflib, 
  libpng, libjpeg, libx11, libxext, libxi, 
  libxrender, libxtst, libxxf86vm, libpulseaudio
}:
let 
  version = "3.2.0";
  build = "240";
in stdenv.mkDerivation {
  pname = "pocketbard";
  inherit version;

  src = fetchurl {
    url = "https://downloads.pocketbard.app/desktop/releases/v${version}-b${build}/pocketbard-${version}-${build}-linux-amd64.tar.gz";
    hash = "sha256-OhyLhkYR9iyv1qaLsMrJRrAxggXe94CWrVbDG+bzcNU=";
  };

  nativeBuildInputs = [ autoPatchelfHook patchelf ];
  buildInputs = [
    stdenv.cc.cc.lib
    zlib
    alsa-lib
    fontconfig
    libGL
    giflib libpng libjpeg
    libx11
    libxext
    libxi
    libxrender
    libxtst
    libxxf86vm
  ];
  runtimeDependencies = [ libGL fontconfig libx11 libpulseaudio ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r bin lib share $out/
    runHook postInstall
  '';

  postFixup = ''
    patchelf \
      --add-needed libpulse.so.0 \
      --add-rpath ${lib.makeLibraryPath [ libpulseaudio ]} \
      $out/lib/runtime/lib/libwwisebridge.so
  '';

  postInstall = ''
    substituteInPlace $out/share/applications/com.pocketbard.pocketbard.desktop \
      --replace-fail "/usr/lib/pocketbard/bin/pocketbard" "$out/bin/pocketbard"
  '';

  meta = {
    description = "Interactive music and ambience for your tabletop RPG sessions";
    platforms = [ "x86_64-linux" ];
  };
}
