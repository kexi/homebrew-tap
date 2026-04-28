class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.1-beta.94"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1-beta.94/vibe-darwin-arm64"
      sha256 "df99851677b781721cb7c9e504721e3bec6b320478904d643d7d02481e40f130"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1-beta.94/vibe-darwin-x64"
      sha256 "69194c67b05dac679f83bf935ac542802d3c83a737867d1cd33e72fdd5d05a59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1-beta.94/vibe-linux-arm64"
      sha256 "f96c08277e7a475e5c84c5faabc23b4ad6e3a32768812775187ab09ba93b1803"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1-beta.94/vibe-linux-x64"
      sha256 "c61d48f4addac2f686eb5363b5c370784092ea09c86a68cef1dbd61a7ed30c35"
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
