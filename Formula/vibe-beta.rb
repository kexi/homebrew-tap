class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.2-beta.52"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.52/vibe-darwin-arm64"
      sha256 "449153f6423454ceab818f4139ba07f9b0f4609be428abfee0dd7f6310409364"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.52/vibe-darwin-x64"
      sha256 "2b374d3eeff3a8fbf8cba56b72f52d911064131f85c1542f27cadd6a398c872e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.52/vibe-linux-arm64"
      sha256 "5d445d27f0d10c4c00035a9ee66480b8985bbcde8d6edf46b1f3e583436b0ed2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.52/vibe-linux-x64"
      sha256 "f35583b946aba287f875d6fe9a8a3c62896e44765afc1a70e3b1f79c7beaed0a"
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
