class Utopia < Formula
  desc "RDK-B Utopia service framework"
  homepage "https://github.com/rdkcentral/utopia"
  url "#{homepage}/archive/1.4.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/utopia-v1.4.0"
    sha256 cellar: :any, arm64_tahoe: "4c0cd90904a3a0e03f93de5da7ec48ae979b1c641ad4207ec2f8fa2181e68ec1"
  end
  version "1.4.0"

  depends_on "pkg-config" => :build
  depends_on "msgpack-cxx"
  depends_on "librdk-logger"
  depends_on "libsafec"
  depends_on "libccsp-common"
  depends_on "libsyswrapper"
  depends_on "rbus"
  depends_on "libwebconfig-framework"
  depends_on "telemetry"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
