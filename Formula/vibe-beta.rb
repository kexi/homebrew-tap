class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.17.0-beta.7"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.7/vibe-darwin-arm64"
      sha256 "7b9b55ddc2f974f7feb4f44045ee94935bbb08f3fcffbac77ee1d3da7bf449b7"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.7/vibe-darwin-x64"
      sha256 "9faaa029fde4f2f06bf4600bd66643a42abb335bf6b744f7c2a2f66b380c4451"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.7/vibe-linux-arm64"
      sha256 "984b34db39959c803c66fc91e1d5a89c34ecb1e83e0aac07f6bcc6e7813e51b6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.7/vibe-linux-x64"
      sha256 "d0275f1cb77c90e83df41440db3b73eb1cf4ff548a45a84e5f77e3c0a7cbfda1"
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
