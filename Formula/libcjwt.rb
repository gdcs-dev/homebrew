class Libcjwt < Formula
  desc "C JWT implementation"
  homepage "https://github.com/xmidt-org/cjwt.git"
  url "#{homepage}/archive/v2.3.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libcjwt-v2.3.0"
    sha256 cellar: :any, arm64_tahoe: "ba6e56e71ed05a6d9817fd21ce52dbb524fe26949b702e88b341509fbe6439b9"
  end
  version "2.3.0"

  depends_on "cmake" => :build
  depends_on "openssl"
  depends_on "libtrower-base64"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
