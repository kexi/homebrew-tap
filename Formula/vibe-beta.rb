class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1-beta.78"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.78/vibe-darwin-arm64"
      sha256 "3d54b50abcd0b2ad9506cea46bb92752d78b254b2bac132e33062b33186d449a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.78/vibe-darwin-x64"
      sha256 "fc3352ca8f7fb65521c009d9a354b469224aa58bcfce2fc42ee13f62ef973e95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.78/vibe-linux-arm64"
      sha256 "351ead4aed2fc854f06fa833b64c882ad87e4bc95f873fa1fd4905e98ce31a22"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.78/vibe-linux-x64"
      sha256 "b6e02fc502d746e4b1407ed0168e48a4022d08c7440619d93314f67134336004"
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
