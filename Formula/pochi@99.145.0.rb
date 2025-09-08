class PochiAT991450 < Formula
  desc "Pochi: Open Source AI Coding Agent"
  homepage "https://docs.getpochi.com"
  version "99.145.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-mac-arm64.tar.gz"
      sha256 = "409fd613be7b8505ce7f8efdcdf1b278f85e180e7aeb6148004618328911af41"
    else
      odie "Unsupported macOS architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-linux-x64.tar.gz"
      sha256 = "1d2100a2c3b0c5be71adc58c20487e463377916b63658aa9b7e5ca73bcc4e131"
    else
      odie "Unsupported Linux architecture: #{Hardware::CPU.type}"
    end
  else
    odie "Unsupported operating system: #{OS.kernel_name}"
  end

  def install
    bin.install "pochi" => "pochi"
  end

  def caveats
  <<~EOS
    Pochi is a command-line interface (CLI) that allows you to run an AI agent directly from the command line.
    If you have used Pochi VSCode extension before, you do not have to login again.
    To get started, run the following command:

    pochi --prompt "What is the time now?"
  EOS
  end
end