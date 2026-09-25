class LibwebconfigFramework < Formula
  desc "WebConfig framework library for RDK components"
  homepage "https://github.com/rdkcentral/webconfigframework"
  url "#{homepage}/archive/1.1.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libwebconfig-framework-v1.1.0"
    sha256 cellar: :any, arm64_tahoe: "3f57e85b863ff747500a71e0d3a0ccbb6ac4a58be5d5a9b8fe721a7f331d7efd"
  end
  version "1.1.0"

  depends_on "rbus"
  depends_on "libsafec"
  depends_on "libccsp-common"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
