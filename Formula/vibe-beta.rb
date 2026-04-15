class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1-beta.83"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.83/vibe-darwin-arm64"
      sha256 "6708d80a9c128eac35709b9aa6be04f050d8dbdc7e86f4fc32f8ae2b05627feb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.83/vibe-darwin-x64"
      sha256 "00eacd03e9dc93f061d2a65df6de82ae99058520467a7a7fc0b34115179538b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.83/vibe-linux-arm64"
      sha256 "1d8f6f974bd78151eda2a274089d8e4f321012952251426e13b97b107fe91f55"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.83/vibe-linux-x64"
      sha256 "b746dfc0ba42fd859b2c474ba06f5b713bdeaa34c80edd32ca1f57fce5298f31"
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
