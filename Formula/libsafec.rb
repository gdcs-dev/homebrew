class Libsafec < Formula
  desc "Safe C Library - secure string and memory functions to prevent buffer overflows"
  homepage "https://github.com/rurban/safeclib"
  url "#{homepage}/archive/v3.7.1.tar.gz"
  sha256 ""
  license "MIT"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libsafec-v3.7.1"
    sha256 cellar: :any, arm64_tahoe: "5ebb978bf462cedc2823c420acec91b05fdc786dc098305422624acd500380ac"
  end
  version "3.7.1"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "perl" => :build

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
