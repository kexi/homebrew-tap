class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.0-beta.11"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.0-beta.11/vibe-darwin-arm64"
      sha256 "46300938918902b510c33dc761adb72114de5909e1ba624afd409d9298433b2b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.0-beta.11/vibe-darwin-x64"
      sha256 "90f0a31a5372a314886471956aa24cc2ae87c8a63494beeed42072a1f1971966"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.0-beta.11/vibe-linux-arm64"
      sha256 "3442540056748ae13f02e3a23524fa2181740e7551b745b30a23cdeb1ad83ecf"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.0-beta.11/vibe-linux-x64"
      sha256 "4bab41e27ba09a8234ff257a0040bd6c3c6fe875053f9a4f86b3247ed5e47d47"
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
