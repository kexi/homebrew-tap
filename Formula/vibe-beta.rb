class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.2-beta.57"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.57/vibe-darwin-arm64"
      sha256 "7254a42e8102981b086835b9f4e4a7cf4bef40e7c2dff12ef97443c7f7eb836f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.57/vibe-darwin-x64"
      sha256 "d5db67998019393a9261160891cc33a8be4a608f9adaad662ed2ef2226e80eb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.57/vibe-linux-arm64"
      sha256 "1aeb22ec91c714dec6aacabf8b5de634626957223bbeaa9a2bb80568eb16b20b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.57/vibe-linux-x64"
      sha256 "bbf1dfcf5062c25b2b1e9d1b5c67e40b649fd01670a89fa79d661bce504daf58"
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
