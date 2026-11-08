class Evnx < Formula
  desc "Manage .env files — validate, scan for secrets, convert formats, and sync them end-to-end encrypted"
  homepage "https://www.evnx.dev"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "fdeea74ee63627ae3b85bee309d047f7e7d4af6f3a2f114b48f11a32f5953947"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "f24b1ea6948c527e3e58167102f5aba5cb161ac25e03d54f8fa37d05162cda7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17d2e3f59794dcb625ced806d5ac88d3f2afdc1a4d82cdae56ac65a2f2dd5b26"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "94117664df7d828775d8817965787d7617ea64903f1400b62eaa099fe5c4f67e"
    end
  end

  def install
    on_macos do
      on_arm   { bin.install "evnx-aarch64-apple-darwin" => "evnx" }
      on_intel { bin.install "evnx-x86_64-apple-darwin"  => "evnx" }
    end
    on_linux do
      on_arm   { bin.install "evnx-aarch64-unknown-linux-gnu"  => "evnx" }
      on_intel { bin.install "evnx-x86_64-unknown-linux-musl"  => "evnx" }
    end
  end

  def caveats
    <<~EOS
      Run 'evnx --help' to get started.
      Documentation: https://docs.evnx.dev/cli

      If 'evnx --version' does not say #{version}, another copy comes
      first on your PATH. '#{opt_bin}/evnx update --list' lists them all.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/evnx --version")
  end
end
