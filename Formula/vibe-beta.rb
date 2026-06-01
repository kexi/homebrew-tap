class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.8.0-beta.134"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.134/vibe-darwin-arm64"
      sha256 "fe1d3fe1ebcd5957baf1a20926291eb2618c2770e59b7724073e4b0a728e10d9"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.134/vibe-darwin-x64"
      sha256 "7ed068b0069fc4794ebeeb9f12156bcb6cdf5542f72be96aa75c0763abc4873b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.134/vibe-linux-arm64"
      sha256 "f36f5d7fa78d23bcec2cf42bf73ae50ab9a3116d15daef31e58d6d7def857c37"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.134/vibe-linux-x64"
      sha256 "2924a65fde01e94c9f54a795a2a24eca6da6e835289c0ba27a9e8d4b6ad1d8b7"
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
