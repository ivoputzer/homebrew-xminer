require "formula"

class Cpuminer < Formula
  # homepage "https://github.com/tpruvot/cpuminer-multi"
  # head "https://github.com/tpruvot/cpuminer-multi.git", :branch => "linux"
  # url "https://github.com/tpruvot/cpuminer-multi.git", :tag => "v1.3.1-multi"
  # version "v1.3.1-multi"
  homepage "https://github.com/orangejuicy/cpuminer-multi"
  head "https://github.com/orangejuicy/cpuminer-multi.git", :branch => "linux"
  url "https://github.com/orangejuicy/cpuminer-multi.git", :tag => "v1.3.1-multi"
  version "v1.3.1-multi"
  # automake
  # autoconf
  # pkg-config
  # libcurl4-openssl-dev
  # libjansson-dev
  # libssl-dev
  # libgmp-dev
  # make
  # g++
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on 'pkg-config' => :build
  # depends_on "openssl" => :build
  depends_on "libtool" => :build
  depends_on "jansson"
  depends_on "openssl"
  depends_on "curl"
  depends_on "zlib"
  # For compilers to find this software you may need to set:
  #     LDFLAGS:  -L/usr/local/opt/zlib/lib
  #     CPPFLAGS: -I/usr/local/opt/zlib/include
  # For pkg-config to find this software you may need to set:
  #     PKG_CONFIG_PATH: /usr/local/opt/zlib/lib/pkgconfig
  depends_on "gmp"
  # depends_on 'uthash' => :build
  # depends_on 'curl'
  # depends_on 'jansson'
  # depends_on 'libusb'
  # depends_on 'libmicrohttpd'
  # depends_on 'libevent'
  def install
    system "export OBJECT_MODE=64"
    system "./autogen.sh"
    system "./nomacro.pl"
    system "./configure CFLAGS=\"-march=native -O2 -Ofast -flto -DUSE_ASM -pg\" --with-crypto=/usr/local/opt/openssl --with-curl=/usr/local/opt/curl --with-crypto --with-curl"
    # -02 -m32 -Ofast -flto -fuse-linker-plugin -ftree-loop-if-convert-stores
    # "LDFLAGS=\"-L/usr/local/opt/zlib/lib\"",
    # "CPPFLAGS=\"-I/usr/local/opt/zlib/include\"",
    # "PKG_CONFIG_PATH=\"/usr/local/opt/zlib/lib/pkgconfig\"",
    system "make -j4"
    bin.install "cpuminer"
  end
  test do
    system "cpuminer --cputest"
  end
end
