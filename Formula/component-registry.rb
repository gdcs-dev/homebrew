class ComponentRegistry < Formula
  desc "RDK Component Registry (CR)"
  homepage "https://github.com/rdkcentral/component-registry.git"
  url "#{homepage}/archive/1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/component-registry-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "2511855a59e065bddd8e9a0ab7f3abac84017478f4c63c59990c3a79da3b03ee"
  end
  version "1.0.0"

  depends_on "pkg-config" => :build
  depends_on "libtrower-base64"
  depends_on "libsafec"
  depends_on "librdk-logger"
  depends_on "libccsp-common"
  depends_on "rbus"
  depends_on "libxml2"
  depends_on "libsyswrapper"
  depends_on "telemetry"
  depends_on "utopia"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
