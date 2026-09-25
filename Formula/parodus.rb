class Parodus < Formula
  desc "XMiDT client coordinator"
  homepage "https://github.com/xmidt-org/parodus.git"
  url "#{homepage}/archive/v2.10.3.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/parodus-v2.10.3"
    sha256 cellar: :any, arm64_tahoe: "37741d851b59f5f38cbb223fb3d1f1992c1ee0a0d6d47d5a469139fa46833a18"
  end
  version "2.10.3"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on "curl"
  depends_on "libnanomsg"
  depends_on "libnopoll"
  depends_on "libtrower-base64"
  depends_on "libcimplog"
  depends_on "libcjwt"
  depends_on "libwrp-c"
  depends_on "librdk-logger"
  depends_on "rbus"
  depends_on "libwdmp-c"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/parodus", "--version"
  end
end
