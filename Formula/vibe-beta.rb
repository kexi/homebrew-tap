class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.0-beta.105"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0-beta.105/vibe-darwin-arm64"
      sha256 "f98d677dc580147e1e9b28e14a60f850e21140c6a02ea8c6407cd395de753388"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0-beta.105/vibe-darwin-x64"
      sha256 "fc067557ff38d5466b56d3bb655113b8dc427eecfa26670916487bff9741acb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0-beta.105/vibe-linux-arm64"
      sha256 "aa492181a12b830bfac4ae43770e5b4ed875aed56a5f3aec78cbc137b006dbca"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.0-beta.105/vibe-linux-x64"
      sha256 "409424c06d9dd348f6bc177d324bd44c8770c713845de0f23868ab6d123fcd05"
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
