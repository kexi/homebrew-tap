class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1-beta.79"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.79/vibe-darwin-arm64"
      sha256 "168264940736b563c5712bcf7a869aa248eeee509c10e5e515611f59f84e3cc7"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.79/vibe-darwin-x64"
      sha256 "ba45d30ccd0e3bfae326f3dd927f51e85e7cd740990f2fb71a83803507e68589"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.79/vibe-linux-arm64"
      sha256 "c0e03016d4f72e473396850628157a888599232182517e04780cdaf220773bde"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.79/vibe-linux-x64"
      sha256 "0af1693c0139b7a8d03eb3014c5a4358ec18a8c9a016e72507d4f7ee079e368e"
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
