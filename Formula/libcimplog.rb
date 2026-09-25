class Libcimplog < Formula
  desc "Simple logging library designed to work with RDK Logger"
  homepage "https://github.com/xmidt-org/cimplog.git"
  url "#{homepage}/archive/v1.0.3.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libcimplog-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "7bc67c155863f0604fbdaa157ff711982b423a31074b0cb4dbc423e942f725e0"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "librdk-logger"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
