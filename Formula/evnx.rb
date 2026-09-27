class Evnx < Formula
  desc "CLI tool for managing .env files — validation, secret scanning, format conversion"
  homepage "https://www.evnx.dev"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "782aec6b96a412cd64767e44df2f74aa7b4b4b36287345504d24dab12761418b"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "77b5082949fbdf88c304d9db52bb918408cebfb100a8b814252f4478d8fed3d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ca80df89034825c74998c348ed46a9103c521857da9ac9d34f5c84441b21f9c"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9acab6e97d32640d2f51caa525c142485bc19d345c14faaba5707a9a80e1238e"
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
