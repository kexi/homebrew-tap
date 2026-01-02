class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.3.0/vibe-darwin-arm64"
      sha256 "4b5581a80e675e4daaa2a66f09b37582daac52d2ba0c7f1dbffbfdef8dfb2002"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.3.0/vibe-darwin-x64"
      sha256 "195a59b0eabbf62e1d7a484c589790ed8077c64968dd762874e0546a4bf1b4e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.3.0/vibe-linux-arm64"
      sha256 "ce5af470b7a64b37c59c11578d9ab97bae023f083b5ee33b7d9787e75371d0f6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.3.0/vibe-linux-x64"
      sha256 "dea8136d26313ed78246bc3fb378f9234067474c24227ba752ec9f1c6f385641"
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
