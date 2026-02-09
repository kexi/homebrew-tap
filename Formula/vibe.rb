class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0/vibe-darwin-arm64"
      sha256 "1f5f179a8395cb937559bbacc9b1efb670c7519d9abb14cc71502266fb998be5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0/vibe-darwin-x64"
      sha256 "d10c60502a2e903b66a3631e17492e7ab93923afe32d5fb9fd299cbada6c505d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0/vibe-linux-arm64"
      sha256 "8dd42d17079c1d6756fc521f965b733ba1c98c9699beedd0a2e92ea58ca71676"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.0/vibe-linux-x64"
      sha256 "becf01308749c0de56db18d4440eb4b13c504a18febc8dc6a5f71fa3f6d15d32"
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
