class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.18.1-beta.14"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.1-beta.14/vibe-darwin-arm64"
      sha256 "8831ca39e128f1e75ebc63ee2f5fe3842a1f51ab2466ab3c6406d7039460eeb8"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.1-beta.14/vibe-darwin-x64"
      sha256 "81a91d052fc99d1dfe681764ed996351ca0128e8e1ae8164dc8a422bab0e1ab9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.18.1-beta.14/vibe-linux-arm64"
      sha256 "e300af08482f8eb425d43345357e80cbbb0accbe53bbbc0562ba569ff80e331c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.18.1-beta.14/vibe-linux-x64"
      sha256 "df31beab5644f028f19a8f89f373af2dbe04e122c50c46cea8d22accfa85243a"
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
