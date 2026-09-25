class Libnanomsg < Formula
  desc "High-performance implementation of scalability protocols - runtime"
  homepage "https://github.com/nanomsg/nanomsg.git"
  url "#{homepage}/archive/1.2.2.tar.gz"
  sha256 ""
  license "MIT"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libnanomsg-v1.2.2"
    sha256 cellar: :any, arm64_tahoe: "d9a59338ef969d08a9be47c155876c9a31fa09784bcb2c1b2dd002eca09ec836"
  end
  version "1.2.2"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
