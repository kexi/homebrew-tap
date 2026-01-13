class Vibe < Formula
  desc "Git worktree helper CLI"
  homepage "https://github.com/kexi/vibe"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.6.0/vibe-darwin-arm64"
      sha256 "c95422f950f3b2e58df4502e0810d4db113e721f832d0635346445a44d690890"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.6.0/vibe-darwin-x64"
      sha256 "d7e6fdb90f57041e39771d3b17a91624ba4984b0c9bfb77e0cae64a8e4aef477"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v0.6.0/vibe-linux-arm64"
      sha256 "c101565fd2de7e4fbe17b5ab1088df8c40655906846fafba472063abc7bb234e"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v0.6.0/vibe-linux-x64"
      sha256 "1db2c3c72700cdbc521dab76ba2fe37b0f18e77c9320c2e211a3670a606dab88"
    end
  end

  def install
    binary_name = "vibe-darwin-arm64" if OS.mac? && Hardware::CPU.arm?
    binary_name = "vibe-darwin-x64" if OS.mac? && Hardware::CPU.intel?
    binary_name = "vibe-linux-arm64" if OS.linux? && Hardware::CPU.arm?
    binary_name = "vibe-linux-x64" if OS.linux? && Hardware::CPU.intel?

    bin.install binary_name => "vibe"
  end

  def caveats
    <<~EOS
      Add this to your .zshrc:
        vibe() { eval "$(command vibe "$@")" }
    EOS
  end

  test do
    system "#{bin}/vibe", "--help"
  end
end
