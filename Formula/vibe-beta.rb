class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.6.0-beta.114"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.114/vibe-darwin-arm64"
      sha256 "b271a8a8e78d0a14ce6cb41bf20405c14e0092803779d4fb50ab106bde891250"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.114/vibe-darwin-x64"
      sha256 "f94af7ab79422b935f871d46c3708e029edac01931c31ee376209ded4fc69f2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.114/vibe-linux-arm64"
      sha256 "8d3b048b2bdc5e7d8f73758a7bbb03e97a19edc2f6bfc1452d846c86fc82f463"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.114/vibe-linux-x64"
      sha256 "a0f34962204fdc219b591f9ccc584b3696a5a538e91bd94ce153c00e82320b98"
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
