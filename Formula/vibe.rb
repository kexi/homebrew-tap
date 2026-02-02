class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.18.0"
  license "MIT"

  conflicts_with "vibe-beta", because: "both install the same binary"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.0/vibe-darwin-arm64"
      sha256 "49f45eb9a933ab58526ade66403ace238805fb87e47ad70c5f651cf2a468cd49"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.0/vibe-darwin-x64"
      sha256 "3d97501811bd832b1f1a64163f04fbe69769dee3149990b0bf45142a407c116d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.0/vibe-linux-arm64"
      sha256 "96a3157359eca0209db82e4c4f7817491a2d4021e51133e6d4272750d2c98168"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.0/vibe-linux-x64"
      sha256 "37a4317e6d76c1f8526e60bb81e3792e346b884db6daf789ea2152f3141ba82a"
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
