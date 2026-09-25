class XmidtRbus < Formula
  desc "xMiDT RBus integration library"
  homepage "https://github.com/rdk-gdcs/xmidt-rbus"
  url "#{homepage}/archive/v1.0.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/xmidt-rbus-v1.0.0"
    sha256 cellar: :any, arm64_tahoe: "427fd3ea97a9a49bc6df131be08e3c73418753196fa2b11e79dc71704f6353d6"
  end
  version "1.0.0"

  depends_on "cmake" => :build
  depends_on "rbus"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  def post_install
    # Create log directory
    (var/"log").mkpath

    # Auto-start the service after installation
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "start", "xmidt-rbus" unless ENV["HOMEBREW_NO_AUTO_START"]
    ohai "xmidt-rbus service has been started automatically"
    ohai "To stop: brew services stop xmidt-rbus"
  end

  service do
    run [opt_bin/"xmidt-rbus"]
    # not using keep_alive so that stop actually terminates the process
    log_path var/"log/xmidt-rbus.log"
    error_log_path var/"log/xmidt-rbus.log"
  end

  def caveats
    <<~EOS
      A launchable service has been defined for xmidt-rbus.
      To start now and restart at login:
        brew services start #{name.downcase}
      Or, if you don't want/need a background service you can run:
        #{opt_bin}/xmidt-rbus
    EOS
  end

  test do
    system "true"
  end
end
