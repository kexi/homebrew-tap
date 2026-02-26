class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.22.2-beta.56"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.56/vibe-darwin-arm64"
      sha256 "b368178820de39b5b4973a7404ea170201fab0ffcc86c7614bc2660efc96ca9b"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.56/vibe-darwin-x64"
      sha256 "db21e8a700cd150da7234667b782df00929a788f950c3bf0de5bf62c49261f1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.56/vibe-linux-arm64"
      sha256 "1ade9608b1f3734faf3677387f4e1cf3f5b7dbd6385c92f9cd18fe880d62ff85"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.22.2-beta.56/vibe-linux-x64"
      sha256 "df128f722772517961013982d0aa4d7bb9a2c2b6b48b2945e4a6f722d386b6d2"
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
