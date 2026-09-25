class Liblinenoise < Formula
  desc "Minimal, zero-config, BSD licensed, readline replacement"
  homepage "https://github.com/antirez/linenoise"
  url "#{homepage}/archive/e26268d.tar.gz"
  sha256 ""
  license "BSD-2-Clause"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/liblinenoise-v1.0"
    sha256 cellar: :any, arm64_tahoe: "1990d268bb0da190f420e77c1c21a4ce5205d15ee4ea7412d9050c151db54a65"
  end
  version "1.0"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "true"
  end
end
