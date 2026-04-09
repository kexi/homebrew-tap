class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.1.1-beta.82"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.82/vibe-darwin-arm64"
      sha256 "a56be74cf26155fe1de894434e353a94548318fb9a9fb18ff6490f21f63e993f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.82/vibe-darwin-x64"
      sha256 "8ce7758e6fc14e631101d32e95c18e21db68d1c69e42c26a9cced143c3412fc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.82/vibe-linux-arm64"
      sha256 "df7a56e6756782336111d0f57a70d595938c8be9cbf6ef1e6e8f32d3989a4b8f"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.1.1-beta.82/vibe-linux-x64"
      sha256 "06a04db7ec206c1b2265dba784a58028157320896e4395d34d9f4dc7f1fd5471"
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
