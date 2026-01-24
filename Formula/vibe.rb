class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.15.1/vibe-darwin-arm64"
      sha256 "59eea65607425cc746f827d2730f6fcd6c4473620c3280d2b88260cfb2d863c4"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.15.1/vibe-darwin-x64"
      sha256 "9c8c4ab405e54b145a0806c88a2b5fa578917a03801fa3de91434dbe1e1df90d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.15.1/vibe-linux-arm64"
      sha256 "7d5130baa9d5f0526691fbf4fc0e248a7e7cc8452ad0235b69f47df26bed7550"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.15.1/vibe-linux-x64"
      sha256 "f921164d36b0343281869899a48ac453fd674561bf00cae4d69a96142e67e520"
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
