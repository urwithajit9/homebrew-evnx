class Evnx < Formula
  desc "Manage .env files — validate, scan for secrets, convert formats, and sync them end-to-end encrypted"
  homepage "https://www.evnx.dev"
  version "0.10.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "38fd2f388cd4d17b90494bb93667367a607e3650b16e03d3a76c117b004a98c5"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "b9e0a171ef2e11f78c4f54e50af1ee8e3eeae298fa8c6044cff187c3c0d8f2d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c84912d69a070a1ef9af9788e924be605671265d84a1ae2aaf7a8b62ade02b2d"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "95843abc5512a9e4afcb9493ba80850650a88be3654f29886948479ab7675624"
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
