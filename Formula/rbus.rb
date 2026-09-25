class Rbus < Formula
  desc "RDK Bus messaging system - runtime"
  homepage "https://github.com/rdkcentral/rbus"
  url "#{homepage}/archive/v2.9.0.tar.gz"
  sha256 "cdc91ed90bb5e64abde450e602255f62c250d2b08c5617e77567dff7e70480de"
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/rbus-v2.9.0"
    sha256 cellar: :any, arm64_tahoe: "cbde26dcd2d73d109a11f63ee392403252fe72b197465041d474de75846ca521"
  end
  version "2.9.0"

  depends_on "cmake" => :build
  depends_on "curl"
  depends_on "msgpack-cxx"
  depends_on "liblinenoise"
  depends_on "cjson"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end
  
  def post_install
    # Create log directory
    (var/"log").mkpath
        
    # Auto-start the service after installation
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "start", "rbus" unless ENV["HOMEBREW_NO_AUTO_START"]
    ohai "rtrouted service has been started automatically"
    ohai "To stop: brew services stop rbus"
  end
  
  service do
    run [opt_libexec/"rtrouted-service"]
    # not using keep_alive so that stop actually terminates the process
    log_path var/"log/rtrouted.log"
    error_log_path var/"log/rtrouted.log"
  end

  def caveats
    <<~EOS
      A launchable service has been defined for rtrouted.
      To start now and restart at login:
        brew services start #{name.downcase}
      Or, if you don't want/need a background service you can run:
        #{opt_bin}/rtrouted
      The service wrapper automatically removes /tmp/rtrouted on shutdown.
    EOS
  end

  test do
    system "true"
  end
end
