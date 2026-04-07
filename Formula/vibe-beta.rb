class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.73"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.73/vibe-darwin-arm64"
      sha256 "804946db6291d442e10545640dc0370ecbf98559d806d20f1739c12fb2e449fb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.73/vibe-darwin-x64"
      sha256 "97ee4e2bb2197682e29bf791f7b365ac199b257f0aaacb435d5c3d522db50ccc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.73/vibe-linux-arm64"
      sha256 "ecd6b942c0efe2c848d15c4b3e7bf85c5b7eed9c76c313af9c00fbc4f21f33cb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.73/vibe-linux-x64"
      sha256 "07ed7b77e01d42da2bc451ddbcc2b8ccca2cc720af0ce349c6620dc89edeedfd"
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
