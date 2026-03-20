class Evnx < Formula
  desc "CLI tool for managing .env files — validation, secret scanning, format conversion"
  homepage "https://www.evnx.dev"
  version "0.3.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "9fa716dfcfbf7dbb1b7e85135c12d7f2c7478a46b22f6a9fe52e20739ed13780"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "35da3adf05693140ec63c16d9a2f3c01ec574db781d006e7733a399075b62c01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd9493ae8582f269faa0322bb234fd368c1ab6405b461b1baca4a02318189807"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "955d49621d0a8d9a228ceaefb9c272d886f1406b871d34912e7c1c352d26c7ea"
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
      Documentation: https://www.evnx.dev/guides
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/evnx --version")
  end
end
