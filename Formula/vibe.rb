class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.14.0/vibe-darwin-arm64"
      sha256 "e2d81da40a22e7209eb220275b0a7011499a9bec18789197844927b3ebd1f20a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.14.0/vibe-darwin-x64"
      sha256 "e37af7d3e00d9c98300f98e343e339fcce0ac7b75c2e3337a0f701b12cb17788"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.14.0/vibe-linux-arm64"
      sha256 "da8b7b7127b3c6dd9ec9e8ca7a8db3b5b7734984cfb899ae393ad88b4c0e8315"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.14.0/vibe-linux-x64"
      sha256 "fee4fdf5ba062b69c96e9a0e93e696fffc84e10447b6df3b7d9e1969992957bd"
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
