class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.75"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.75/vibe-darwin-arm64"
      sha256 "150bb4fb6e654370291d78757fe3fd19b884479a67f9da16a3f15ab8834611d2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.75/vibe-darwin-x64"
      sha256 "fcf0c365268e50a1c0e8388331cee3b7f7b8a31df8552de806c14511d3005865"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.75/vibe-linux-arm64"
      sha256 "8076925cc6a9de2e1bac9020dcd3017033a45a94717896820b8a567ec4a180ca"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.75/vibe-linux-x64"
      sha256 "4c1553b5a5e6039acf8f4fb1625b61d895428fb02be9691f09c1d5ef41595d33"
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
