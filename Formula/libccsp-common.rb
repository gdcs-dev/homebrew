class LibccspCommon < Formula
  desc "CCSP Common Library"
  homepage "https://github.com/rdkcentral/common-library"
  url "#{homepage}/archive/1.3.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libccsp-common-v1.3.0"
    sha256 cellar: :any, arm64_tahoe: "137dd9f1dc202079aa968bd967ae65f129b4a008b9600d6317f52fedf2ae10c6"
  end
  version "1.3.0"

  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on "libsafec"
  depends_on "rbus"
  depends_on "libtrower-base64"
  depends_on "librdk-logger"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "true"
  end
end
