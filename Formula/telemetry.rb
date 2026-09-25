class Telemetry < Formula
  desc "RDK Telemetry 2.0 framework"
  homepage "https://github.com/rdkcentral/telemetry.git"
  url "#{homepage}/archive/1.7.3.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/telemetry-v1.7.3"
    sha256 cellar: :any, arm64_tahoe: "68f7b54d1b688669672de1aa6291dd0ddb227cb4c30c943ee9599cc13452c9ac"
  end
  version "1.7.3"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "msgpack-cxx"
  depends_on "curl"
  depends_on "rbus"
  depends_on "librdk-logger"
  depends_on "libsyswrapper"
  depends_on "libwebconfig-framework"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
