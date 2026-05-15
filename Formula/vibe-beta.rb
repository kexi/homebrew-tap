class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.2-beta.110"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.110/vibe-darwin-arm64"
      sha256 "3d89054a44874ec33c2fd2ab8f6d81978a00dae52b5d8accb467774ab102a008"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.110/vibe-darwin-x64"
      sha256 "73cc982068ca93f46eee41027bc6bacfd4be0c4740ac95c0de53a8b56a85a16e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.110/vibe-linux-arm64"
      sha256 "f099da1efd2962db0eed7ef24907859bc7953ee700935b80836013cfbc6fc9d6"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.2-beta.110/vibe-linux-x64"
      sha256 "59cf81daf7a957babcc5f6c551b5d150d248560cb9ae074840fd14aac6de2ec1"
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
