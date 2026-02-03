class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.18.2"
  license "MIT"

  conflicts_with "vibe-beta", because: "both install the same binary"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.2/vibe-darwin-arm64"
      sha256 "54ee50aaddb63eadd2b4c6a6a6a69d8521100c72cd6bd0bee1e10f10820a69b9"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.2/vibe-darwin-x64"
      sha256 "5b513b1a86537654d6a8a781410cb16735221e5d970526101b8ee4b1c90b455e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.2/vibe-linux-arm64"
      sha256 "b7ef1cb1e55375fb57de4e1bb6318a0970ee53d07721de122125f1f50052b06c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.2/vibe-linux-x64"
      sha256 "ef1d32b7d4a180565a93f2fe1df99a6a623f9d7f3bdbbc8538a2bbe5bda437b3"
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
