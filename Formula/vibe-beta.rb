class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.7.0-beta.120"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.120/vibe-darwin-arm64"
      sha256 "672c1cbd4775155e695ad4c258e1cd2c92d72f2e2fb4fd3667ab1832f555d7b9"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.120/vibe-darwin-x64"
      sha256 "c662a0fac4c56e77675d30b27cba3e97ee1f09b5e1937e097fa50f7a303def5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.120/vibe-linux-arm64"
      sha256 "bf999aa766fdb55e509caeb8b70ff2683f3d1acf3cc217b7fd1aa3154d33d997"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.7.0-beta.120/vibe-linux-x64"
      sha256 "954f054e6a54ebe73a2e27a7ab2a47b691597b3add703e6ffc2586e422c5d70c"
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
