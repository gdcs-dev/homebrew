class Ubus < Formula
  desc "OpenWrt RPC daemon and CLI"
  homepage "https://git.openwrt.org/project/ubus.git"
  url "#{homepage}"
  sha256 ""
  license "LGPL-2.1"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/ubus-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "eb9ca1a0d04acee1306d72933b748f411489e0a4d1bf49f8396136b4d9828809"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "json-c"
  depends_on "libubox"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/ubus", "--help"
  end
end
