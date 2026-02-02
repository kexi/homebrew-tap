class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.18.1"
  license "MIT"

  conflicts_with "vibe-beta", because: "both install the same binary"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.1/vibe-darwin-arm64"
      sha256 "b9da6534f74bcb5a08bda04a5f3bab7c43863bf6ee34487686e59c38dc85ffd5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.1/vibe-darwin-x64"
      sha256 "32c5accc52084b55b61d686da140deb6f557ba1ccdb42db00009a4014d3cc218"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.1/vibe-linux-arm64"
      sha256 "4ef7d613cd160836a33845541144d25145bc52da9956417d4f1833e03957fa40"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.1/vibe-linux-x64"
      sha256 "fee5a58e807ee3cc5c9ef93e198fdd5acf1ac5150f2e7a943a6ee229e5fe8c75"
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
