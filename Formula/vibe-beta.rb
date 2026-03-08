class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.0.0-beta.62"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0-beta.62/vibe-darwin-arm64"
      sha256 "e54633e423dd29498942e4e1ffd6365098df1bd8b53f151cb3ca76343488b9a3"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0-beta.62/vibe-darwin-x64"
      sha256 "cbb6270a3bb0acf22362d04df180fcbcdc200b7dcf6f23f418f4824a0e7fdf45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0-beta.62/vibe-linux-arm64"
      sha256 "665960d5f4a2845c44503453f22bf1f4a0137ac1f6f69c22116c6662c0d7f6d5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0-beta.62/vibe-linux-x64"
      sha256 "3830276ec9d953b9167352b44490737aca5139a70a5319eac24939d9b41ba0f2"
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
