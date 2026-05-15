class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.2-beta.111"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.111/vibe-darwin-arm64"
      sha256 "f89295ead1ce0bb176decd375e690896147560f5d3aba9e4d2a43dced8a763e3"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.111/vibe-darwin-x64"
      sha256 "0a4fd1700d5943e614e3987c453db75f27c7f14755f31e0fbbe99f30bca608f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.111/vibe-linux-arm64"
      sha256 "2fa07e2349a93a27a891dbf730b93186cc90635a84fda31297fafcabe58b4e4d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.111/vibe-linux-x64"
      sha256 "a389df1e0ef35d92e18ed63d574654d78cb7de09c6d8abbde2ae88cc90eba705"
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
