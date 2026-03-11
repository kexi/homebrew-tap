class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.0-beta.72"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.72/vibe-darwin-arm64"
      sha256 "4c44d194969cb6dd5d01be0f6061a277ed06cd3c86cff9644bbae352bcd000a1"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.72/vibe-darwin-x64"
      sha256 "25ef6227b40695296f5c793a831a0bcd4edfc6530b61ee1bb496048bea8a2663"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.72/vibe-linux-arm64"
      sha256 "1759bcedaa8b5852575957ba4eb90916c588dc02fc25ce176c582b9493f074c2"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.0-beta.72/vibe-linux-x64"
      sha256 "ee2ea8f327658b14303cfadc5138b9256176d9a8acc4e771be278e14fcce155d"
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
