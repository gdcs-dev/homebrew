class BlizzardRdk < Formula
  desc "Blizzard RDK is the implementation of the Blizzard Framework specific to Reference Design Kit (RDK) devices"
  homepage "https://github.com/rdk-gdcs/BlizzardRDK.git"
  url "#{homepage}/archive/v0.0.1.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/blizzard-rdk-v0.0.1"
    sha256 cellar: :any, arm64_tahoe: "e2d65276d0c4aca7db16a90945ff71b3a8eda7f6871892b692564949b22823d3"
  end
  version "0.0.1"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build
  depends_on "protobuf"
  depends_on "grpc"
  depends_on "spdlog"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/blizzard-rdk", "--version"
  end
end
