class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.10.0/vibe-darwin-arm64"
      sha256 "ca7ee973daad3a24cdae363d8a4a813df942369fdc05b5ae896fb3c51a154176"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.10.0/vibe-darwin-x64"
      sha256 "d86101e63a306a331d0d39ef5444cec804af200490ab9bd5d66b8064c63bdb70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.10.0/vibe-linux-arm64"
      sha256 "64c3e57c7e61368381223b21ce9f8a6800e207a2f7c5367840407371d06adb63"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.10.0/vibe-linux-x64"
      sha256 "32971a2aeb1e46e13191bc8a65cecdfee33568912e80b3afc9da6620f6cf0e96"
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
