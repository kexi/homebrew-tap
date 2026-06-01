class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.8.0-beta.132"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.132/vibe-darwin-arm64"
      sha256 "722af1dca90638a61d6276f8fffdf55480953af91c1489a61d49187becfb297c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.132/vibe-darwin-x64"
      sha256 "d16ce51bf9e4297ccd7799eef8ffa877ddcf504b70ada18869c28a42205a520e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.132/vibe-linux-arm64"
      sha256 "395b7779d6f5f542817c87e551e8a7532500ba1716d2ee0b3ae1c825992e555a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.132/vibe-linux-x64"
      sha256 "2f806b430e759420c0b2aa93645e9e2f12d078ed8b70354f782d6771e0e123d2"
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
