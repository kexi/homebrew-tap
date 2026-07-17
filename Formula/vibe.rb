class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "2.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.1.0/vibe-darwin-arm64"
      sha256 "f7852538e400fcaa7d9649fff1644a35332546f4e66648144833aa4283dd64c2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.1.0/vibe-darwin-x64"
      sha256 "cabf83ed5107a1958ff964c7c598cf4eceb1ad855ea2eefa69ca7a300c974d57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v2.1.0/vibe-linux-arm64"
      sha256 "6b22a0947d02dfcd622c36e69703c59a8d7c8991cef9700cd3e0ee2867a823cf"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v2.1.0/vibe-linux-x64"
      sha256 "d11a197891843c221b1e46507af2a7a429e102039976860bc0153e0dd49a1159"
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
