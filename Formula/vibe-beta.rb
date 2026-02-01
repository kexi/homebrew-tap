class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.17.0-beta.8"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.8/vibe-darwin-arm64"
      sha256 "81ab477ac0809590c4048a8f9030d4a228b73c5b3441f160da1e13f1fdc8f497"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.8/vibe-darwin-x64"
      sha256 "5b17c15f264ef70a5addc0fa837a82c81d333580c7b3338383eb0606b1ebd4b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.8/vibe-linux-arm64"
      sha256 "535543635d0f13e6ec3faefb52de92df36b5271afbb3a5b36d8b4d1cc8c931c7"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.8/vibe-linux-x64"
      sha256 "05bf015fc5dc09ce80c8e2d6338173eb7cb9ac44d1b76cc60944f303a10272de"
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
