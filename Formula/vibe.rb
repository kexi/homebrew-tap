class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.1/vibe-darwin-arm64"
      sha256 "38a1618c47c7d9974011c1ec8b0aaf098ad4f92e826fad658c013ea916f6636d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.1/vibe-darwin-x64"
      sha256 "760340b5221a81bf45611fd517090876ff63b6a0ac6065fe29181f8c89ddf83c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.1/vibe-linux-arm64"
      sha256 "33ea0ba3506493ef7a831be8b463399e7f7ba493ead8f6bb762d21333836210f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.1/vibe-linux-x64"
      sha256 "6a840db01532714be25add09d817ca3113fc09f235c36f35f980ec2728d00c50"
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
      Add this to your .zshrc:
        vibe() { eval "$(command vibe "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe", "--help"
  end
end
