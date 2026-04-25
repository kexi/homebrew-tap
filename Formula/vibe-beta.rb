class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1-beta.84"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.84/vibe-darwin-arm64"
      sha256 "1c8a06f9c8be6daf05d8f1395f28733f6d220b321d00ca307d62717762095626"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.84/vibe-darwin-x64"
      sha256 "e07b8ebea52d579a1f3709f6b4c89fafe4ea267c2e4900d3272b587cff986729"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.84/vibe-linux-arm64"
      sha256 "2e1031d1c9e97abe8bebd5d10d823918b5efa412e524f12b2c6fc703d305f600"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.84/vibe-linux-x64"
      sha256 "86b1c6b7d05119bc407c273d4dd72dd163237f163a947555bf2cb1e255592088"
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
