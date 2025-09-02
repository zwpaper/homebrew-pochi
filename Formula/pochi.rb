class Pochi < Formula
  desc "Pochi: AI Agent Teammate"
  homepage "https://docs.getpochi.com"

  version "0.5.7"

  if OS.mac?
    if Hardware::CPU.arm?
      arch = "mac-arm64"
    else
      odie "Unsupported macOS architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      arch = "linux-x64"
    else
      odie "Unsupported Linux architecture: #{Hardware::CPU.type}"
    end
  else
    odie "Unsupported operating system: #{OS.kernel_name}"
  end

  url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-#{arch}.tar.gz"

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