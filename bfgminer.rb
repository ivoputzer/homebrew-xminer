require "formula"

class Bfgminer < Formula
  homepage "https://github.com/luke-jr/bfgminer"
  head "https://github.com/luke-jr/bfgminer.git", :branch => "bfgminer"
  url "http://luke.dashjr.org/programs/bitcoin/files/bfgminer/5.1.0/bfgminer-5.1.0.zip"
  sha256 "7b56f7f59dbb019972641dc252372c5235e0b6433bdcfd6f6966d3087346bbe2"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "uthash" => :build
  depends_on "curl"
  depends_on "jansson"
  depends_on "libmicrohttpd"
  depends_on "libevent"
  depends_on "libusb"
  depends_on "hidapi"
  # depends_on "yasm"

  def install
    system "NOSUBMODULES=1 ./autogen.sh"
    system "./configure",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--prefix=#{prefix}",
      "PKG_CONFIG_PATH=#{HOMEBREW_PREFIX}/opt/curl/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/jansson/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/libmicrohttpd/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/libusb/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/hidapi/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/libevent/lib/pkgconfig",
      "--enable-scrypt",
      "--enable-cpumining",
      "--enable-keccak",
      "--enable-opencl"
    system "make", "install"
  end

  test do
    system "bfgminer"
  end
end
