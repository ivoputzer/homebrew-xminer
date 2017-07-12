require "formula"

class Minerd < Formula
  homepage "https://github.com/lucasjones/cpuminer-multi"
  head "https://github.com/lucasjones/cpuminer-multi.git", :branch => "master"
  url "https://github.com/lucasjones/cpuminer-multi.git", :tag => "v1.0.3"
  version "v1.0.3"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "openssl" => :build
  depends_on "libtool" => :build
  depends_on "jansson"
  depends_on "curl"

  def install
    system "./autogen.sh"
    system "perl ./nomacro.pl"
    system "./configure CFLAGS=\"-march=native\" US_CPPFLAGS=\"-03\" --with-crypto --with-curl"
    system "make"
    bin.install "minerd"
  end
  test do
    system "minerd --help"
  end
end

