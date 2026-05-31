class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.6.0-beta.119"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.119/vibe-darwin-arm64"
      sha256 "bf31264575452abd15c5c4ae679c3d6bdfa4d8a1830a3d1bc818172741462ecf"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.119/vibe-darwin-x64"
      sha256 "e00a2a033eb2f2adeb80bbcf1f65add73963f29736f9d85c7bfbe17a2d563026"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.119/vibe-linux-arm64"
      sha256 "a53407169f527667982bca29ba79085de973a219c449e51a0286b62cda2070ef"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.119/vibe-linux-x64"
      sha256 "09e77d85059683590c28af3f18ae0d99fec5b8e8b5ec7146cd9e8e93eb254dd9"
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
