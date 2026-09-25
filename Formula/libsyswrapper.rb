class Libsyswrapper < Formula
  desc "Secure wrapper for system calls with privilege management support"
  homepage "https://github.com/rdkcentral/libSyscallWrapper"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libsyswrapper-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "1c723a2e582fcb1aff19bcbb2b093ec5b7faaf430e8c4409b1d0410fc42c0df7"
  end
  version "1.0.0"

  depends_on "librdk-logger"

  def install
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
