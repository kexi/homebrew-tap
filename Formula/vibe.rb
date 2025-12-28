class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.2.1/vibe-darwin-arm64"
      sha256 "6fb79f12ce8666af3455135d8cde20534612d41795c9f624a510ebfdc0f3d0bf"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.2.1/vibe-darwin-x64"
      sha256 "9faf65124bfb5d8676547999a81f2cef20b33a97685b9653f8d31bae6b656271"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.2.1/vibe-linux-arm64"
      sha256 "7dfe78b9174784c8def3a510b8baa52e2a4451167de5c5f7931031b3f09d1d0c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.2.1/vibe-linux-x64"
      sha256 "55dfffbd34de5389ff1e8a0b2f134d246a1ebacebdf6b994f3951c2f972a4f70"
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
