class Uci < Formula
  desc "OpenWrt Unified Configuration Interface - runtime"
  homepage "https://github.com/openwrt/uci.git"
  url "#{homepage}/archive/v2025.01.05.tar.gz"
  sha256 ""
  license "LGPL-2.1"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/uci-v2025.01.05"
    sha256 cellar: :any, arm64_tahoe: "07561945288f8eb6a5bf7b573b6812eda881d1cb132ff2a6ad67eafeeabeff6f"
  end
  version "2025.01.05"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libubox"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/uci", "--help"
  end
end
