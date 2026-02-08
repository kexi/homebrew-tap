class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.20.0-beta.38"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.38/vibe-darwin-arm64"
      sha256 "b21cc93239bab6b32872ae0abef39a5242eac55117b3f11babecc36c12d59a3f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.38/vibe-darwin-x64"
      sha256 "87de7e11daa37e22e3340d8572cb8e71169ac1d0b26e6ad83ec0976dfa5c7e79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.38/vibe-linux-arm64"
      sha256 "ab74e1f9a87be626102b15d441ab8737090ca3c04f308e199c941818c7cb195c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.38/vibe-linux-x64"
      sha256 "84b93616cec2266e91022e0d3fef2f5c1906556da0a13dfdef3fd806cb9af824"
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
