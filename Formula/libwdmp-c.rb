class LibwdmpC < Formula
  desc "WebPA Data Model Parser library"
  homepage "https://github.com/xmidt-org/wdmp-c"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libwdmp-c-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "9a7abe872a3d04e1645b3fafae7d5b6a03da8ccfe2741d313242badec46f066c"
  end
  version "1.0.0"

  depends_on "cmake" => :build
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
