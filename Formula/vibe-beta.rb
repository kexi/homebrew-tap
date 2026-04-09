class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1-beta.81"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.81/vibe-darwin-arm64"
      sha256 "44dccd8e64743322c73dbc230781531f083eca9257cc3e72fa747bad9002a0e3"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.81/vibe-darwin-x64"
      sha256 "81f70065cf1d9438cc667d8f56581831422072a89f111ee4d6930e7f4ed4c127"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.81/vibe-linux-arm64"
      sha256 "72c199be1a6a5e3c4d8fca09f9621e5f599fe395300345106bc9e1527c436a8a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.81/vibe-linux-x64"
      sha256 "21c28a1312d62862f6f8bef5c79cbe717d295e04aad745de7cde7a8c608d33e2"
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
