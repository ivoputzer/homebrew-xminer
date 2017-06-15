require "formula"

class CpuminerMulti < Formula
  homepage "https://github.com/lucasjones/cpuminer-multi"
  head "https://github.com/lucasjones/cpuminer-multi.git"
  url "https://github.com/lucasjones/cpuminer-multi/archive/v1.0.3.zip"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "jansson"

  def install
    system "./autogen.sh"
    system "perl nomacro.pl"
    system "./configure CFLAGS=\"-march=native\" US_CPPFLAGS= \"-03\""
    system "make"
    bin.install "cpuminer"
  end
end
