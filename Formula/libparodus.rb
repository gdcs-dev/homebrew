class Libparodus < Formula
  desc "C implementation of the Parodus adapter"
  homepage "https://github.com/xmidt-org/libparodus.git"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libparodus-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "27509a54db4278f6fd5f6a6e0221839e073c5c3d50d1d0f538a004a06cce8c20"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "libnanomsg"
  depends_on "libtrower-base64"
  depends_on "libcimplog"
  depends_on "msgpack-cxx"
  depends_on "libwrp-c"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
