class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.3-beta.102"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.102/vibe-darwin-arm64"
      sha256 "20832d49c58f5478b50a92ac555eebbdf64eec27bd84d7919e763e6774c4f5f9"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.102/vibe-darwin-x64"
      sha256 "5aa49124009401b3c08621fbd9686fb4581621d89693794f70644e175a1443bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.102/vibe-linux-arm64"
      sha256 "1ca210a99d56e5bd6789724e82873a27eaba55c9a2111d3fd7fd26297d3d79e8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.102/vibe-linux-x64"
      sha256 "b2024e9a396248a34668e50a75d140f3c367cc31d42158eb6e786000584810a8"
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
