class Evnx < Formula
  desc "Manage .env files — validate, scan for secrets, convert formats, and sync them end-to-end encrypted"
  homepage "https://www.evnx.dev"
  version "0.10.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "6e25a404f99cf32243eb9a106b7ee984bfc188c450497b4b0fff221c710a289f"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "bc5c32e27c67967fe373da3387bb9c7f178c5f2869ca870377d8e3879b42c9fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f776793922fc1d6a6147c20fff4835dbae1b08162cb8aa586751ee28fa19165"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ea9c2060eccca2fc99069bf5015bf6bb035400c2ce593eb5259c7ab49b9b9c19"
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
