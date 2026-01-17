class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.12.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.3/vibe-darwin-arm64"
      sha256 "66256d2f4ce620d19a2faf9cdccb5d8db31c867a6def795b165ce521e6f018e2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.3/vibe-darwin-x64"
      sha256 "fa8081064363c133c4c7300da885d0509fe7be2efb28cafb8a0612b2df504352"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.3/vibe-linux-arm64"
      sha256 "adea3dc6bc817251fdfdd6ac272dfc6f3d0f4a4621a9beb28a0f3788ce3f8ef8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.3/vibe-linux-x64"
      sha256 "de5ffa38474da07ed726f9d53538ff54fac4fdd200498771af4e4187a0a96f4d"
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
