class VibeBeta < Formula
  desc "Git worktree helper CLI (beta channel)"
  homepage "https://github.com/kexi/vibe"
  version "1.4.2-beta.98"
  license "MIT"


  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.98/vibe-darwin-arm64"
      sha256 "87b13269f8b79db2c58358c27745610c7c672442e62c859579c4f44ee077fe3d"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.98/vibe-darwin-x64"
      sha256 "6b055aeb0c7c40e2a68f0c2d82065ba98813d0909977e73c61f2b30e116a4cb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.98/vibe-linux-arm64"
      sha256 "ae457fcd056263a5f3df369e2b60d173439e787ff7c8871dd17484dce7348236"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.4.2-beta.98/vibe-linux-x64"
      sha256 "11b671aae5d538bbab42438ca1831cf4bd35730ccf2568bf10404490cda29cd4"
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
