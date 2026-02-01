class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.17.0-beta.5"
  license "MIT"

  conflicts_with "vibe", because: "both install the same binary"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.5/vibe-darwin-arm64"
      sha256 "1ff1cdf7834fb71211c22af1dbc9bc7e600504aa652526752204f371f5084e4f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.5/vibe-darwin-x64"
      sha256 "b4a20920434abe60268798f021cc286791cdd1c66ae823f33b61f4fab69732d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.5/vibe-linux-arm64"
      sha256 "4e699e3e8d8d3920ccc6ad6ce4b68685fc23f9ee28d16ee7b170400f6556837a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.5/vibe-linux-x64"
      sha256 "16baad05839704897ac879081014584b2e079ba8d0b45d49d7c13da0c935e13b"
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
      ⚠️  This is a BETA version installed from the develop branch.
      It may contain unstable features. For the stable release, use:
        brew install kexi/tap/vibe

      Add this to your .zshrc:
        vibe() { eval "$(command vibe "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe", "--help"
  end
end
