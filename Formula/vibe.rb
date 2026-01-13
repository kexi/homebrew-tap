class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.7.0/vibe-darwin-arm64"
      sha256 "2081bf90678cecc2a83bf11b68b94cee8bfe1553a8c945c9063c290a00863be5"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.7.0/vibe-darwin-x64"
      sha256 "5632e0b293427676ab4dad3756a63fc5aaf5cb7e080fe080584343f3cb9334e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.7.0/vibe-linux-arm64"
      sha256 "b0c6979d5f1b7cab9f584d7f8ade07acf08af24fee86b89483931dda222b7377"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.7.0/vibe-linux-x64"
      sha256 "d18bed88d238a6596cbc5b65b305013f686dcd13050e092a5a54383f2239070b"
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
