class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.1-beta.107"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.1-beta.107/vibe-darwin-arm64"
      sha256 "ae6c892f4b254734eaa0fceed0b9de37f68c72109449898719b75c0de7f41aee"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.1-beta.107/vibe-darwin-x64"
      sha256 "81f50e63208f96c23957936f52411c480d227ebb44109d6de116e178c222d6a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.1-beta.107/vibe-linux-arm64"
      sha256 "e0ddcb1c6f3e23731ddc3aa7e36c5f4953b777bda10cb0b0c9276f92a8c08d4e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.1-beta.107/vibe-linux-x64"
      sha256 "c5037372b1211964ea5dd6e629dee075ec958915739a407d3e10382219f1c04a"
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
