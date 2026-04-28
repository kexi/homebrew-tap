class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.2-beta.97"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.97/vibe-darwin-arm64"
      sha256 "b1b62323975862556681cb75483c4d1f58d1095a6ea38cfe94a2d963b0fd2472"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.97/vibe-darwin-x64"
      sha256 "267ece35dc2181618fe2b2e0217a47ff55ec4b58d06e43d586c0d0daa50b5bed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.97/vibe-linux-arm64"
      sha256 "85fb433ec34314689fd08dd27edb658b9cea8fe82b81e245a6b877ed676bbf22"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.97/vibe-linux-x64"
      sha256 "234f3e84f8962babd2c7f521c960252db6714f4b5e9615719eba1840a208cdc2"
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
