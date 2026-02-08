class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.20.0-beta.39"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.39/vibe-darwin-arm64"
      sha256 "cebff96e76632e6eb387deebd2b1a04a180e0edcf7f5192cc3a6ce48e1562d39"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.39/vibe-darwin-x64"
      sha256 "9b1751b3e400ee5ff32f0df89f58a4a868905d49c1fd90c1d501a8f1a37507f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.39/vibe-linux-arm64"
      sha256 "47470fc993703373d3e032d5c13606d00ebbf414b35dc1afa702c222686cbd76"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.39/vibe-linux-x64"
      sha256 "282c6703197b6a2a50a12ababbf61a35da17b8b73a08ad1225cfe7eaa5bbd412"
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
