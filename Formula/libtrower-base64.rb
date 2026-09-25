class LibtrowerBase64 < Formula
  desc "C implementation of base64 encode/decode"
  homepage "https://github.com/Comcast/trower-base64"
  url "#{homepage}/archive/v1.2.7.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/libtrower-base64-v1.2.7"
    sha256 cellar: :any, arm64_tahoe: "557831e1bf3769b4825bac23c5700d7607c16c14f78288749bb0c499a24c78c1"
  end
  version "1.2.7"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "python@3" => :build

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "true"
  end
end
