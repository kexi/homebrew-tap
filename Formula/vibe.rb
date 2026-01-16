class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.11.0/vibe-darwin-arm64"
      sha256 "65799fd4425e05256ed00a0b7eaf866ccad9b9cfc6d56d27ee4a9f4d2b9104de"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.11.0/vibe-darwin-x64"
      sha256 "7ea208ad92f7636c610dfa42833ee2026443c662ffcd9a8c717856cc3be0f45e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.11.0/vibe-linux-arm64"
      sha256 "5e6253be7e81fae110d55c8a783d7f0afeab59f520d9e58ee032cc8a1da260dc"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.11.0/vibe-linux-x64"
      sha256 "71c8914e99f1858b7dfad2ca01feb8ffd1d04d7d282c0e78c19942d4a45297f6"
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
