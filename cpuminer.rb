require "formula"

class Cpuminer < Formula
  # homepage "https://github.com/tpruvot/cpuminer-multi"
  # head "https://github.com/tpruvot/cpuminer-multi.git", :branch => "linux"
  # url "https://github.com/tpruvot/cpuminer-multi.git", :tag => "v1.3.1-multi"
  # version "v1.3.1-multi"
  homepage "https://github.com/orangejuicy/cpuminer-multi"
  head "https://github.com/orangejuicy/cpuminer-multi.git", :branch => "linux"
  url "https://github.com/orangejuicy/cpuminer-multi.git", :revision => "41b1ac5dc6bc4d0800e6b2b5c3bb48e32735a8c5"
  version "v1.3.1-patched"
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "jansson"
  depends_on "openssl"
  depends_on "curl"
  depends_on "zlib"
  depends_on "gmp"
  def install
    system "export OBJECT_MODE=64"
    system "./autogen.sh"
    system "./nomacro.pl"
    system "./configure CFLAGS=\"-march=native -O2 -Ofast -flto -DUSE_ASM -pg\" --with-crypto=/usr/local/opt/openssl --with-curl=/usr/local/opt/curl --with-crypto --with-curl"
    system "make -j4"
    bin.install "cpuminer"
  end
  test do
    system "cpuminer --cputest"
  end
end
