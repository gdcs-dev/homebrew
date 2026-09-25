class Libubox < Formula
  desc "OpenWrt utility library"
  homepage "https://git.openwrt.org/project/libubox.git"
  url "https://github.com/openwrt/libubox.git"
  sha256 ""
  license "ISC"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libubox-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "24265f7947539ac41cc098b89c2ced3e45ca9957a0ffe25e1a702f396f08f886"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "json-c"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
