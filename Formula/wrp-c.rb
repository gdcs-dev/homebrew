class LibwrpC < Formula
  desc "C implementation of Web Routing Protocol - runtime"
  homepage "https://github.com/xmidt-org/wrp-c.git"
  url "#{homepage}/archive/v1.1.3.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/wrp-c-v1.1.3"
    sha256 cellar: :any, arm64_tahoe: "468529549931bbc2ded8cfd646bf414e190380cdb8b9df272697eeea6025b033"
  end
  version "1.1.3"

  depends_on "cmake" => :build
  depends_on "msgpack-cxx"
  depends_on "libtrower-base64"
  depends_on "libcimplog"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
