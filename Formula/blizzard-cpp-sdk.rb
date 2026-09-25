class BlizzardCppSdk < Formula
  desc "Blizzard C++ SDK library - runtime"
  homepage "https://github.com/rdk-gdcs/BlizzardCppSdk.git"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/blizzard-cpp-sdk-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "01bf8ecdf1b526319381984ad61a1ee2c0d741c289cd84bc701ea8c4a9e2b40a"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "protobuf"
  depends_on "grpc"
  depends_on "spdlog"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
