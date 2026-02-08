class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.20.0-beta.41"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.41/vibe-darwin-arm64"
      sha256 "fe739aed99a315430cd15ed3b454c4d2818e58995424ef21c4838db732a20cb2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.41/vibe-darwin-x64"
      sha256 "31ff8e5dc4cc8cddbdbc62aedb4e53ed9435febbb7bfef839da8298790454eca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.41/vibe-linux-arm64"
      sha256 "e362dae44e11a33d1cd030fa77fffc25e16424f252bbc4971e80b463d0f1bfe8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.41/vibe-linux-x64"
      sha256 "33ef383f98616e075bb2e170dc7cffa92e5bab26f7d9121d4d8aa68783ee177d"
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
