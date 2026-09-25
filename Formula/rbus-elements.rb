class RbusElements < Formula
  desc "RBus Elements Provider"
  homepage "https://github.com/stepherg/rbus-elements"
  url "#{homepage}/archive/v1.0.1.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/rbus-elements-v1.0.4"
    sha256 cellar: :any, arm64_tahoe: "9985c89bb0dbeb584974176efba1301355ae7d95a28add5d745d42f7fcb7d7cb"
  end
  version "1.0.4"

  depends_on "cmake" => :build
  depends_on "jansson"
  depends_on "msgpack"
  depends_on "rbus"

  def install
    system "cmake", "-S", ".", "-B", "build",
           "-DRBUS_ELEMENTS_INSTALL_SYSTEM_FILES=OFF",
           "-DRBUS_ELEMENTS_PSM_STATE_PATH=#{var}/lib/rbus-elements/psm.json",
           *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  def post_install
    # Create log and PSM state directories
    (var/"log").mkpath
    (var/"lib/rbus-elements").mkpath

    # Auto-start the service after installation
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "start", "rbus-elements" unless ENV["HOMEBREW_NO_AUTO_START"]
    ohai "rbus_elements service has been started automatically"
    ohai "To stop: brew services stop rbus-elements"
  end

  service do
    run [opt_bin/"rbus_elements", "#{HOMEBREW_PREFIX}/share/rbus_elements/elements.json"]
    # not using keep_alive so that stop actually terminates the process
    environment_variables RBUS_ELEMENTS_PSM_STATE_PATH: var/"lib/rbus-elements/psm.json",
                          RBUS_ELEMENTS_PSM_SEED_PATH:  opt_prefix/"share/rbus_elements/psm-seed.json"
    log_path var/"log/rbus_elements.log"
    error_log_path var/"log/rbus_elements.log"
  end

  def caveats
    <<~EOS
      A launchable service has been defined for rbus_elements.
      To start now and restart at login:
        brew services start #{name.downcase}
      Or, if you don't want/need a background service you can run:
        #{opt_bin}/rbus_elements /opt/homebrew/share/rbus_elements/elements.json
    EOS
  end

  test do
    system "true"
  end
end
