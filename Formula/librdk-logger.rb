class LibrdkLogger < Formula
  desc "RDK Logger - general-purpose logging mechanism for RDK components"
  homepage "https://github.com/rdkcentral/rdk_logger.git"
  url "#{homepage}/archive/v2.4.0.tar.gz"
  sha256 ""
  license "Apache-2.0"
  bottle do
    root_url "https://github.com/gdcs-dev/homebrew/releases/download/librdk-logger-v2.4.0"
    sha256 cellar: :any, arm64_tahoe: "e8339473067c71c9e0f49c6b4f3e91b35531356fa953d2f33c14aaffda644219"
  end
  version "2.4.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    ENV.append "LDFLAGS", "-Wl,-headerpad_max_install_names"
    system "./configure", *std_configure_args
    system "make"
    system "make", "install"
    
    # Install log4crc configuration file to share directory
    pkgshare.install "log4crc" if File.exist?("log4crc")
  end
  
  def post_install
    # Create etc directory in Homebrew prefix
    etc.mkpath
    
    # Install debug.ini if it doesn't exist
    debug_ini = etc/"debug.ini"
    unless debug_ini.exist?
      debug_ini.write <<~EOS
        # RDK Logger debug configuration
        # Add your logging configuration here
      EOS
    end
    
    # Install log4crc configuration file
    log4crc = etc/"log4crc"
    unless log4crc.exist?
      cp pkgshare/"log4crc", log4crc if (pkgshare/"log4crc").exist?
    end
  end
  
  def caveats
    <<~EOS
      To complete the setup, create symlinks to the configuration files:
        sudo ln -sf #{etc}/debug.ini /etc/debug.ini
        sudo ln -sf #{etc}/log4crc /etc/log4crc
      
      You can edit the configuration files at:
        #{etc}/debug.ini
        #{etc}/log4crc
    EOS
  end

  test do
    system "true"
  end
end
