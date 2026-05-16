class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.2-beta.112"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.112/vibe-darwin-arm64"
      sha256 "c123e8d63587b0facd3702046f20519764a1b350207540d153ffb67af4b9db22"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.112/vibe-darwin-x64"
      sha256 "05d0ce2d5e81469d93f3faeb98f983458c3ff03b60c51b6f36d59cfd772b46ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.112/vibe-linux-arm64"
      sha256 "5cd9bcb86a3fea9e3df00e4d3a0d70b7159c22cde89252608ee71c620b0f877f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.112/vibe-linux-x64"
      sha256 "6b2670124e7270953c07c4d42a1c48c74b7d15ad1bb4f667fb31cf253dcd6ee1"
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
