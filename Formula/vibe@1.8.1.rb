class VibeAT181 < Formula
  desc "Git worktree helper CLI (versioned)"
  homepage "https://github.com/kexi/vibe"
  version "1.8.1"
  license "MIT"
  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.1/vibe-darwin-arm64"
      sha256 "9aa95f5b32179d867493ecdd38a57d6cca4adab8f1bb86392e2212e03c1051f9"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.1/vibe-darwin-x64"
      sha256 "7c601d309210051dcbf99ec295180c943a0713237ea2645f680767a721e04c85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kexi/vibe/releases/download/v1.8.1/vibe-linux-arm64"
      sha256 "9c300153046a11067f83424074be96597b91fccf90d35b8ab7b5081856492343"
    end
    on_intel do
      url "https://github.com/kexi/vibe/releases/download/v1.8.1/vibe-linux-x64"
      sha256 "5014bdfa9d779275f593331846986b923deb4d5fee2dd3ff5a09f95a27d0159c"
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
