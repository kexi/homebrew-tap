class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.12.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.4/vibe-darwin-arm64"
      sha256 "f16aff8d7f06f81879368e0295b3e5b3fb55c690ce0e893511dc310530cf469f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.4/vibe-darwin-x64"
      sha256 "b9ae5dd1b0e78571791752a3dbfff3053ec8bb6d0b42b39136a4bad3d7160823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.12.4/vibe-linux-arm64"
      sha256 "9fd17d058e47dd2a516b8670287f428e94e864688ed4ba7a205db2110571c55f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.12.4/vibe-linux-x64"
      sha256 "1014094b9b8aa8df80cbc9a87d8793cf9f3182dd88a5b157701d16b438df32d3"
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
