class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.4-beta.20"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.20/vibe-darwin-arm64"
      sha256 "510c263ff0ba338bb9346476372cbf7180da1b81cf6bfb645d0f77b0b5244605"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.20/vibe-darwin-x64"
      sha256 "9099bc811dfd149b9190b6d372c53f31a9fe352235e12ab895435c56d6720b59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.20/vibe-linux-arm64"
      sha256 "2ba89f17270c8daa6bc5eb7d06fbded18b7e7f6daba41ce54de9bbd40d6b718b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.4-beta.20/vibe-linux-x64"
      sha256 "13f94176832536bbf724a49492562e4a75545f025a7a0ffe002d0bad12764e46"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe-beta"
  end

  def caveats
    <<~EOS
      ⚠️  This is a BETA version installed from the develop branch.
      It may contain unstable features. For the stable release, use:
        brew install kexi/tap/vibe

      Add this to your .zshrc:
        vibe-beta() { eval "$(command vibe-beta "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe-beta", "--help"
  end
end
