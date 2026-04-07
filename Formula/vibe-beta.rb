class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.76"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.76/vibe-darwin-arm64"
      sha256 "ebb5b8f5af7758f8a5089ef0e612b1b496147a462f6b3229e6e29fd1105a6f50"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.76/vibe-darwin-x64"
      sha256 "ce0917233977dd51f1967539d27c314b7622acb7e2ba94e788e09f1c5fa50d40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.76/vibe-linux-arm64"
      sha256 "c2103a720127a19e9322eed4011eedc2b86e74687e22aa7b6f44df6061a8c193"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.76/vibe-linux-x64"
      sha256 "2d457219ad7809ce732b29b19ec953731c6c4679504e8ca78a218c4a61b8a86c"
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
