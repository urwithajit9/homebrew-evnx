# Formula/evnx.rb
class Evnx < Formula
  desc "CLI tool for managing .env files — validation, secret scanning, format conversion"
  homepage "https://www.evnx.dev"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "886a70aac07938a7696016176207a97564441ffc746e03e3606afb3a5678f4f7"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "175c5d53e899d36705e40fbcbe9e2a70456f79ebc93e254efc671a98936cc224"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63ee67b7651e9aac8b567075be09475106b138c226320ed25ff916350419f27f"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1375dad4afe0b333db8b4b0c5afce3d2067eb5b03f0ed679123ff578070c75ed"
    end
  end

  def install
    # The tarball contains the binary named evnx-<target>
    # Find it and install as 'evnx'
    binary = Dir["evnx-*"].first
    bin.install binary => "evnx"
  end

  def caveats
    <<~EOS
      evnx has been installed. Run 'evnx --help' to get started.

      Documentation: https://www.evnx.dev/guides
      GitHub:        https://github.com/urwithajit9/evnx
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/evnx --version")
  end
end