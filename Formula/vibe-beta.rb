class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.1-beta.95"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1-beta.95/vibe-darwin-arm64"
      sha256 "8974c85295ae15de29f791c0196d1cd6310314b9ae238b5d34b08b7aa3f3202d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1-beta.95/vibe-darwin-x64"
      sha256 "eb7dcc8f94a4a708457f7dbd9e5b39458e3be5050b5f28c345660c6ea5a1135e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1-beta.95/vibe-linux-arm64"
      sha256 "28b98275b2f88ea3b59645f012b674ece6b1d1da7d6db41a6df5cbf600776a01"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.1-beta.95/vibe-linux-x64"
      sha256 "08dceae84ef4d6d4ae6f484798e90ac434bb22e4fd57413c3e4279e9d91b0ddd"
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
