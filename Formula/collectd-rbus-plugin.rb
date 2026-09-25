class CollectdRbusPlugin < Formula
  desc "Collectd plugin for RBUS data-model values"
  homepage "https://github.com/gdcs-dev/collectd-rbus-plugin"
  url "git@github-gdcs:gdcs-dev/collectd-rbus-plugin.git",
      tag:      "v0.1.0",
      revision: "8b184c7ae25d23b3dd7766721453e0ef07efc8c8"
  version "0.1.0"
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/collectd-rbus-plugin-v0.1.0"
    sha256 cellar: :any, arm64_tahoe: "51c511c1db172ce45441fb7af18a4e2ed7cedfa94c8d5b29a2cef3615fd52320"
  end

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "collectd"
  depends_on "rbus"

  resource "collectd-source" do
    url "https://storage.googleapis.com/collectd-tarballs/collectd-5.12.0.tar.bz2"
    sha256 "5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6"
  end

  def install
    collectd_headers = buildpath/".brew/collectd-headers/collectd"
    resource("collectd-source").stage do
      system "./configure", "--prefix=#{buildpath}/.brew/collectd-prefix", "--disable-java"
      (collectd_headers/"core").install "src/daemon"
      collectd_headers.install Dir["src/daemon/*.h"]
      collectd_headers.install "src/liboconfig", "src/utils", "src/config.h"
    end

    system "cmake", "-S", ".", "-B", "build",
           "-DBUILD_TESTING=OFF",
           "-DCOLLECTD_INCLUDE_DIR=#{collectd_headers.parent}",
           "-DCMAKE_MODULE_LINKER_FLAGS=-Wl,-undefined,dynamic_lookup",
           "-DCMAKE_INSTALL_RPATH=#{HOMEBREW_PREFIX}/lib",
           "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON",
           *std_cmake_args
    system "cmake", "--build", "build"

    (lib/"collectd").install "build/rbus.so"
    pkgshare.install "conf/types.db.rdk"
  end

  test do
    assert_path_exists lib/"collectd/rbus.so"
    assert_path_exists pkgshare/"types.db.rdk"
  end
end
