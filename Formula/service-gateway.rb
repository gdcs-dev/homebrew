class ServiceGateway < Formula
  desc "Local-area IPC framework daemon and C/C++ client library"
  homepage "https://github.com/cbucht200_comcast/service-gateway"
  url "https://github.com/cbucht200_comcast/service-gateway/archive/v0.1.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/service-gateway-v0.1.0"
    sha256 cellar: :any, arm64_tahoe: "988c1bb881245e5db8f7413c5b54741ae93c47d63284eb58633540d6939864fa"
  end
  version "0.1.0"

  depends_on "rust" => :build
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "msgpack-cxx"

  def install
    # Build the Rust workspace and install the sgwd daemon binary
    system "cargo", "install", "--path", "sgwd", *std_cargo_args

    # Build the C/C++ client library via CMake
    system "cmake", "-S", "sgw-c", "-B", "sgw-c/build",
           "-DSGW_BUILD_TESTS=OFF",
           *std_cmake_args
    system "cmake", "--build", "sgw-c/build"
    system "cmake", "--install", "sgw-c/build"
  end

  def post_install
    # Create log directory
    (var/"log").mkpath

    # Auto-start the service after installation
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "start", "service-gateway" unless ENV["HOMEBREW_NO_AUTO_START"]
    ohai "sgwd service has been started automatically"
    ohai "To stop: brew services stop service-gateway"
  end

  service do
    run [opt_bin/"sgwd"]
    log_path var/"log/sgwd.log"
    error_log_path var/"log/sgwd.log"
  end

  def caveats
    <<~EOS
      A launchable service has been defined for sgwd.
      To start now and restart at login:
        brew services start service-gateway
      Or, if you don't want/need a background service you can run:
        #{opt_bin}/sgwd
    EOS
  end

  test do
    system "#{bin}/sgwd", "--version"
  end
end
