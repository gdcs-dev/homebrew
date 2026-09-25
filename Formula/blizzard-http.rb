class BlizzardHttp < Formula
  desc "HTTP provider implementation for the Blizzard framework"
  homepage "https://github.com/rdk-gdcs/BlizzardHTTP.git"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/blizzard-http-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "9983f17c0961641e99557ab3a8ea923b45216c7e79ef191e058e1b7b0dc39acd"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "blizzard-cpp-sdk"
  depends_on "curl"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
