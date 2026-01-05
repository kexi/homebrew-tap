class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.3.1/vibe-darwin-arm64"
      sha256 "71aea8899c2df8742e3dd27a13b2df9c8f9fbba0c2c85dc1d549c5fcd2db0653"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.3.1/vibe-darwin-x64"
      sha256 "bb501431f7aa39ae1cdb1b931b4f4b20910a5010b97ffbbb863ffa65ece5a0ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.3.1/vibe-linux-arm64"
      sha256 "f564c5458933148e07a1b20a1e6d3848bb22afc45d155115c6f9bcf1bd3eaa67"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.3.1/vibe-linux-x64"
      sha256 "fca88035866e9868304dd6f872e453301e5a873e5e39d9dc01cc9ea20b1c3956"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe"
  end

  def caveats
    <<~EOS
      Add this to your .zshrc:
        vibe() { eval "$(command vibe "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe", "--help"
  end
end
