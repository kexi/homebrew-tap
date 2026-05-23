class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.6.0-beta.116"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.116/vibe-darwin-arm64"
      sha256 "fa59b50c50575beb1b89838a340abddbaff9ef8b0f77359da97472bf1883ce8d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.116/vibe-darwin-x64"
      sha256 "41ca734a99c24333a7caf05cd48e228811358fa59c2961e3bc25c531a862ab88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.116/vibe-linux-arm64"
      sha256 "83c44ec41abe1a7789c080096f1d2224f8dc8a9c2f1f1f447807ac388c554d1e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.6.0-beta.116/vibe-linux-x64"
      sha256 "c93af44e7bc130777eb26ade78ebfec84e8d148b31deee5de696840c0522676b"
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
