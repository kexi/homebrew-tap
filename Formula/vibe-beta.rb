class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.3.0-beta.90"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0-beta.90/vibe-darwin-arm64"
      sha256 "5131206d09f2b33bbc622577aae9e83ce62912bd04b5f13149bb4014aa348148"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0-beta.90/vibe-darwin-x64"
      sha256 "48c6e3ea86d81fa6ce17516ef14431cbbc481162d7452abe61fffedc97e890bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0-beta.90/vibe-linux-arm64"
      sha256 "a4777976eb46d9204c919b1619940a6f616da9ed1915fb304bc5cff8093f4d4f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0-beta.90/vibe-linux-x64"
      sha256 "3a340897f2c89bc091433f087a6630cef8e9d41134e8543b0ec929c9ebebadcc"
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
