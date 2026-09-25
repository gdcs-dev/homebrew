class XmidtAgentRs < Formula
  desc "An xMiDT agent implementation in Rust"
  homepage "https://github.com/rdk-gdcs/xmidt-agent-rs"
  url "https://github.com/rdk-gdcs/xmidt-agent-rs/archive/v0.2.1.tar.gz"
  sha256 "" # Will be calculated during build
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/xmidt-agent-rs-v0.2.1"
    sha256 cellar: :any, arm64_tahoe: "4b5ccb4aab174da5b0fe2b6dd3cdd5e218a172536e1eb32b73b6d7dee8f6d76d"
  end
  version "0.2.1"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def post_install
    # Create log directory
    (var/"log").mkpath

    # Auto-start the service after installation
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "start", "xmidt-agent-rs" unless ENV["HOMEBREW_NO_AUTO_START"]
    ohai "xmidt-agent-rs service has been started automatically"
    ohai "To stop: brew services stop xmidt-agent-rs"
  end

  service do
    run [opt_libexec/"xmidt-agent-rs-service"]
    # not using keep_alive so that stop actually terminates the process
    log_path var/"log/xmidt-agent-rs.log"
    error_log_path var/"log/xmidt-agent-rs.log"
  end

  def caveats
    <<~EOS
      A launchable service has been defined for xmidt-agent-rs.
      The MAC address is read dynamically from en0 at startup.
      To start now and restart at login:
        brew services start xmidt-agent-rs
      Or, if you don't want/need a background service you can run:
        #{opt_libexec}/xmidt-agent-rs-service
    EOS
  end

  test do
    system "#{bin}/xmidt-agent-rs", "--version"
  end
end
