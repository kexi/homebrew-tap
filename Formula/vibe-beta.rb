class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.17.0-beta.6"
  license "MIT"

  conflicts_with "vibe", because: "both install the same binary"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.6/vibe-darwin-arm64"
      sha256 "7e10e0d9fe8f63354933809b8050d07035a5c0be7853916a68b7c0575a710281"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.6/vibe-darwin-x64"
      sha256 "69cbd1b4836aedd44a6f481fce7018d7ab2f9217825e148d1b571efc142aad5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.6/vibe-linux-arm64"
      sha256 "22f762b23636c79ec32d11355b56efc6e3043a654642bf251ec6568603c78d11"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.6/vibe-linux-x64"
      sha256 "84ce8d876af8b2b5d2c3cf920290a370ad268d1c80c8aa456a73f1fe3658a971"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe"
  end

  def caveats
    <<~EOS
      ⚠️  This is a BETA version installed from the develop branch.
      It may contain unstable features. For the stable release, use:
        brew install kexi/tap/vibe

      Add this to your .zshrc:
        vibe() { eval "$(command vibe "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe", "--help"
  end
end
