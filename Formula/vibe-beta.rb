class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.6.0-beta.117"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.117/vibe-darwin-arm64"
      sha256 "de0ca20de2331a4d120d26d275f2dfa313239ad6ed10fab36c0b336629ca0641"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.117/vibe-darwin-x64"
      sha256 "c720539423c18fe9673bf0b35c90b7d590514c5b7dac848e760b1cb39fb75114"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.117/vibe-linux-arm64"
      sha256 "d0291477ae54e18ffacb8a97e3c653460eaf592910421b137ee452222e250432"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.117/vibe-linux-x64"
      sha256 "71be135a065413b66fde3b2e283e6ae80cde9b98703859670a549c8b5dbdba4c"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe-beta"
  end

  def caveats
    <<~EOS
      ⚠️  This is a BETA version installed from the develop branch.
      It may contain unstable features. For the stable release, use:
        brew install kexi/tap/vibe

      Add this to your .zshrc:
        vibe-beta() { eval "$(command vibe-beta "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe-beta", "--help"
  end
end
