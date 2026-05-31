class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.7.0-beta.121"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.121/vibe-darwin-arm64"
      sha256 "2e31449d541463378225281c22c32c3c148aefb87bc0cfd193e26a046a4b6b77"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.121/vibe-darwin-x64"
      sha256 "4a62f80e0ca4055465740602de3441734ef83524a62ee829b00dfbbcad72d35b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.121/vibe-linux-arm64"
      sha256 "0212b39007bb1aa04bbc3f43379653163b2c7750a98b7bb1aa75f18ac59a9a87"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.121/vibe-linux-x64"
      sha256 "e5b52bb4dbab253061f193b90ed4ad37a4491daa27b838a2c53232808eca408e"
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
