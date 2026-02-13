class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.1-beta.51"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.51/vibe-darwin-arm64"
      sha256 "e26111f58caf997fa073c3ad5f9fd76f9bc6b865f22046090c4dbb677ce0a19c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.51/vibe-darwin-x64"
      sha256 "8ce6db32e2344db553e23b5b94a2c56005f2f94c0a94022a09d89f50cafefd13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.51/vibe-linux-arm64"
      sha256 "c1730d8dd714be0e5fcf100a59018afe25f23da6e5799c7da5f8fc02b48c980b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.1-beta.51/vibe-linux-x64"
      sha256 "ddc3d1677a71a82c57e943c9d981cdb12200653c06327dd4754a683fe8278519"
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
