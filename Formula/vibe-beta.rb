class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.0.0-beta.61"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0-beta.61/vibe-darwin-arm64"
      sha256 "757b6e86d2e82cd80f93acbf43e7bea39e8430ff7e92866e86f124e906b0ecc3"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0-beta.61/vibe-darwin-x64"
      sha256 "3c9abc675924fd43d92dc332c14adaa5e9362a92c32f15056a81e78122365388"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0-beta.61/vibe-linux-arm64"
      sha256 "fd055e1e0224bdb52036b60d7c4d543eade7bace7aa9067dcef32c1996aaff63"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.0.0-beta.61/vibe-linux-x64"
      sha256 "9c04bfac837d6206905028df391f8fddf23b9c0acf088c4fe5cc6577c6bdb7df"
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
