class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "0.20.0-beta.42"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.42/vibe-darwin-arm64"
      sha256 "29585acb1ff845a5df9ce01340331b9da7fc61ff6d3a695caaf24de7f7311e83"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.42/vibe-darwin-x64"
      sha256 "ce266224f136029b21d4fe641e567b2b99a8c054c003efd0201aa1f7826c0b68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.42/vibe-linux-arm64"
      sha256 "6e3269a8f380227748f3dc1f67bd3363a2ce2e875cb82e05a241bf2680e72f25"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.20.0-beta.42/vibe-linux-x64"
      sha256 "8f8a2f79fdd0858015ba908c5020b2678cdc103ee25fcbb47e746cf2216db016"
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
