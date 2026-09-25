class Libnopoll < Formula
  desc "OpenSource WebSocket implementation (RFC 6455), written in ANSI C"
  homepage "https://github.com/Comcast/nopoll.git"
  url "#{homepage}/archive/1.0.4.tar.gz"
  sha256 ""
  license "LGPL-2.1"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libnopoll-v1.0.4"
    sha256 cellar: :any, arm64_tahoe: "b01567119a2cd111d2a4ca4c4ccf07b8dd77f6996dbc1332d3a13a7e40d34e84"
  end
  version "1.0.4"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "openssl"

  def install
    system "./autogen.sh" if File.exist?("autogen.sh")
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
