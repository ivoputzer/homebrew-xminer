require "formula"

class CpuminerMulti < Formula
  homepage "https://github.com/LucasJones/cpuminer-multi"
  head "https://github.com/LucasJones/cpuminer-multi.git"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build
  depends_on 'curl'
  depends_on "jansson"

  def install
    system "./autogen.sh"
    system "perl nomacro.pl"
    system "./configure CFLAGS=\"-march=native\" --with-curl"
    system "make"
    bin.install "cpuminer"
  end
end
