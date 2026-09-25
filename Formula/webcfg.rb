class Webcfg < Formula
  desc "Webconfig client implementation"
  homepage "https://github.com/xmidt-org/webcfg"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/webcfg-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "50034010357f8a578f65990e01d685fa6ec2988219485200d913f6ad14de1f71"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "curl"
  depends_on "msgpack-cxx"
  depends_on "rbus"
  depends_on "libcimplog"
  depends_on "libtrower-base64"
  depends_on "libwdmp-c"
  depends_on "libwrp-c"
  depends_on "libcpeabs"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
