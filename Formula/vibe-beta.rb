class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.3.0-beta.89"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0-beta.89/vibe-darwin-arm64"
      sha256 "997cf426007858f90ff09c4626fc5f6cc245c47157a33dd7c49703d2c2435def"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0-beta.89/vibe-darwin-x64"
      sha256 "93bd623605da4d037a1d1c11ce64c6800d3229fa042885db2d4432d92c186501"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0-beta.89/vibe-linux-arm64"
      sha256 "6b0db538b455bd52b9b707cb0c4f6d0a4465958057fd2e752db1d454fdb6753b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.3.0-beta.89/vibe-linux-x64"
      sha256 "61d126516357c2114c2892edc54973c3e2e30c6e64c4aeb6c3e9de28638c2f49"
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
