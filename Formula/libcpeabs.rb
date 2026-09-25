class Libcpeabs < Formula
  desc "Abstraction layer for consumer preference equipment systems"
  homepage "https://github.com/xmidt-org/cpeabs"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libcpeabs-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "0d3b5845046eac21e505ee305e0ae723310c27a5f4615019b38494efc20fb329"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "rbus"
  depends_on "libcimplog"
  depends_on "libwdmp-c"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
