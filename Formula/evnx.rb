class Evnx < Formula
  desc "Manage .env files — validate, scan for secrets, convert formats, and sync them end-to-end encrypted"
  homepage "https://www.evnx.dev"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-apple-darwin.tar.gz"
      sha256 "2f5793c8a3c67523144880970ad06129051bb35dc39af90bdbd8dbc1dfaca391"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-apple-darwin.tar.gz"
      sha256 "0738404f5c36454d85afb9146135263e444cab6044d55484f0e49ac9348e40a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e01e71b126a47a60f8a7c2ca2e4a76e79bf4b585d62c16342b177df46d8766d"
    end
    on_intel do
      url "https://github.com/urwithajit9/evnx/releases/download/v#{version}/evnx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "31f1e222c0427ec5f363a6c0a4e6bd02eabe93e34ee2c53526aa5d4adcfadfdd"
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
    # WP-16: the archive's completions/ folder, the names Homebrew expects.
    bash_completion.install "completions/evnx.bash" => "evnx"
    zsh_completion.install "completions/_evnx"
    fish_completion.install "completions/evnx.fish"
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
