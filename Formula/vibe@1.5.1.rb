class VibeAT151 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.5.1"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.1/vibe-darwin-arm64"
      sha256 "917c94657dd43234ea7a39018a345910f6aaf030c3f3e6e6130768bfbb1271c3"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.1/vibe-darwin-x64"
      sha256 "efe766b4a6f8df2fc098478e1079403a49e35cb4cc4ab89a0e35ef5dfb2ee0d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.5.1/vibe-linux-arm64"
      sha256 "ed3ec834dd2b7b1731bb79dcddf24d0770e4d0703d05e0ce2733ce0858dcb091"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.5.1/vibe-linux-x64"
      sha256 "ef308dbd40761a2f0076813f5556e0a707a4f28e2225d32aef158e40c695063e"
    end
  end

  def install
    binary_name = if OS.mac? && Hardware::CPU.arm?
      "vibe-darwin-arm64"
    elsif OS.mac? && Hardware::CPU.intel?
      "vibe-darwin-x64"
    elsif OS.linux? && Hardware::CPU.arm?
      "vibe-linux-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      "vibe-linux-x64"
    else
      odie "Unsupported platform"
    end

    bin.install binary_name => "vibe"
  end

  test do
    system "#{bin}/vibe", "--help"
  end
end
