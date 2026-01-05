class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.3.2/vibe-darwin-arm64"
      sha256 "d63e7401b03b769b6087bdc64c1b880b704c7cf092594f3a10caedc6bd3904d6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.3.2/vibe-darwin-x64"
      sha256 "f1214d96cd6a9c350f86941157998f5edf32672ee394d124f029973e75f659d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.3.2/vibe-linux-arm64"
      sha256 "6f07fc972be96f4e88b874c62bf9ec281010b438af3f78c2a46752ae7504b967"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.3.2/vibe-linux-x64"
      sha256 "4a366be377b743d58c32071ddd5953db41cd91185292dda28357c8b4d5fe4d6a"
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
