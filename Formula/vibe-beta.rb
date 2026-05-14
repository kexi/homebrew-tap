class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.3-beta.103"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.103/vibe-darwin-arm64"
      sha256 "c730db3f834600fe1dc0346648c39bdd33fb4f4b275871e781f3abdc8506a217"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.103/vibe-darwin-x64"
      sha256 "4214aa5ec8bcc45ce2110b7b1fc6e9c96ffee19e9616c23efab8988abc087619"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.103/vibe-linux-arm64"
      sha256 "074856988c80355d4a43971465ccd3074f667b64e1d57a453fd1e3722df8143d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.3-beta.103/vibe-linux-x64"
      sha256 "f9e08fd19d993bc8ac5d8b7f21f6c637653b6f82a347b0bae4edfa9201ae675b"
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
