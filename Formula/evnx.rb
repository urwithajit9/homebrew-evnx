class Evnx < Formula
  desc "Manage .env files — validate, scan for secrets, convert formats, and sync them end-to-end encrypted"
  homepage "https://www.evnx.dev"
  version "0.10.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "264d8bb7ccb9bf4edbb450de206eb118badf3d7d762fd03e3090c4b38560e49e"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "87d8cdf487460f4308dae6f8c43933a5f9f3a9f1166fbf8e3ccb7421793e557d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0fa20499b28fc47e9d03b5f91b7c556d78c6edec1266dbad8127e9e7f4e9444"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7b6ba08e954faf13e5aaccf39d58f4cdc80fe1b29c3d434a407cb48d6c1a4ce0"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/evnx --version")
  end
end
