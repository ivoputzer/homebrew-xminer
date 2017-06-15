require "formula"

class CpuminerMulti < Formula
  homepage "https://github.com/lucasjones/cpuminer-multi"
  head "https://github.com/ivoputzer/cpuminer-multi", :branch => "patch-1"
  url "https://github.com/ivoputzer/cpuminer-multi/archive/patch-1.zip"
  # sha256 "b7c773b06dd405171a0546092ecb56ac07fdc6fc6fed5ba0490901e5fecffa34"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "openssl" => :build
  depends_on "curl" => :build
  depends_on "libtool" => :build
  depends_on "jansson"

  def install
    system "./autogen.sh"
    system "perl nomacro.pl"
    system "./configure CFLAGS=\"-march=native\" US_CPPFLAGS=\"-03\" --with-curl"
    system "make"
    bin.install "cpuminer"
  end
end
