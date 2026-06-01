class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.8.0-beta.133"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.133/vibe-darwin-arm64"
      sha256 "fdbd617886dcef72deeab19d6211e1d614b836d89cbe3a5fbd98610564382081"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.133/vibe-darwin-x64"
      sha256 "ebe137b6fee97a050befc690cb4314e74b7c17a560fd02f629fb1a8cb923ec4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.133/vibe-linux-arm64"
      sha256 "fb09167306b969e0eb12edb2cee33bc96cb8c1f0efa05db0c359d8ef6ab1425c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.0-beta.133/vibe-linux-x64"
      sha256 "42512655f7412d4c14e4202e28bd1dc9f7b9dbd4e7786d12444034e6b9296295"
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
