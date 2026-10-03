class Evnx < Formula
  desc "CLI tool for managing .env files — validation, secret scanning, format conversion"
  homepage "https://www.evnx.dev"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "11ccb37010b340081b445eb5b0bab1b0d3b3dc24cbe3410fc02f99e29e1256be"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "e020b7fc63cd1caf297235e0d73c446f711ce37dc7fb4071046ade11ee4520f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1acb622596c8c641d4a36caf3d4d6d26537e41e8394bd6fc6f15ab41fa00dc6"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d20493715a1f187fab25bea072c9c1ae33580d73e585ab970a0391f8b9118a71"
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
