class BlizzardTime < Formula
  desc "Time provider implementation for the Blizzard framework"
  homepage "https://github.com/rdk-gdcs/BlizzardTime.git"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/blizzard-time-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "9c04ae7d9a4f96b21a342e31a0760b1f83280a8e84b76882ea6cb22dead4d5a3"
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
