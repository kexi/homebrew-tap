class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.22.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2/vibe-darwin-arm64"
      sha256 "607a514100b5ec1376cfe998a1d77543ef38d562606c5649f7cecf39c6b2bc63"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2/vibe-darwin-x64"
      sha256 "a260d07148da55446c82b484ab078120a4d7647122693cbb062030e90c321e7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2/vibe-linux-arm64"
      sha256 "0ace6d3044302144d26ba077ce48afc916822ee54c662da6b1e9afb5409d6733"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2/vibe-linux-x64"
      sha256 "f830f79edbe92490b574fe5f40acd016f2ac537585470b358624d25a01efe7ff"
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
