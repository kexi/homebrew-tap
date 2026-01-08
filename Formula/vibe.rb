class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.4.0/vibe-darwin-arm64"
      sha256 "6d88c7b7d7e4ed4b5f319a2b1cfd0baa1368d4829c738e455f68e53f36c5426a"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.4.0/vibe-darwin-x64"
      sha256 "8928904b6b8cd04785fbb399e8c89a24e9448b9238258b1e89bee0c904ae57bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.4.0/vibe-linux-arm64"
      sha256 "7a91a2aa6409d929f16102ac8c98e0403e1ac931a7e08422788cc43f2de196bb"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.4.0/vibe-linux-x64"
      sha256 "5c1a957604271f60b7c6f78ab1524f76dd299489f121053df2bd34b131aa2551"
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
