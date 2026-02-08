class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0/vibe-darwin-arm64"
      sha256 "a2ea5a24f16ad1c6d9cb892231f1066077d28d7331ab7a24c774030e9b69ca97"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0/vibe-darwin-x64"
      sha256 "51721ebdeefbb20576c7fdc55f0d235d41b9d4b8dff052c554f8f142d08849d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0/vibe-linux-arm64"
      sha256 "cae3ca9a5b2d10a53dbc8e6fd1bb3bb725af1ef7096fde6f3d85154053dfe7d0"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.21.0/vibe-linux-x64"
      sha256 "3b3725b948d4f431e781d0b7680385642e26c8c7eb3edc3b1b7034aa2f9bebe6"
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
