class BlizzardTinyshell < Formula
  desc "TinyShell implementation for the Blizzard framework"
  homepage "https://github.com/rdk-gdcs/BlizzardTinyShell.git"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/blizzard-tinyshell-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "89925302c229e99a01891ab2ca98a3cda31cf91af8c359c2b9a66dc50e4bf2e7"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "blizzard-cpp-sdk"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
