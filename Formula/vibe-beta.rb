class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.17.0-beta.10"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.10/vibe-darwin-arm64"
      sha256 "1dc20b28def9e633aae4c2e27a7bd110b6f33cb0c4ecdeee0dafd23182b4601c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.10/vibe-darwin-x64"
      sha256 "a15be89d0fb085a955846bf0621a97c663c1194b2c9080b70cdbbf0dac113ddd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.10/vibe-linux-arm64"
      sha256 "eb69b323d38f35060cc210ebd7023b34e3f4579f94201171384281ed3ffa227c"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.17.0-beta.10/vibe-linux-x64"
      sha256 "229232d4801a294930cb87d408b0edd5765c3d27e9e7cd3143b7a45689eea227"
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
