# Homebrew formula for the Radial CLI.
#
# Distribution: this lives in a tap repo (e.g. BrainGridAI/homebrew-radial) as
# Formula/radial.rb. The cli-release GitHub workflow builds a single binary per
# platform on each `cli-v*` tag, uploads them to the GitHub release, and this
# formula is bumped (version + sha256) to point at them.
#
#   brew install BrainGridAI/radial/radial
#
# version + the sha256 values are auto-bumped by the cli-release workflow's
# bump-homebrew job (via cli/homebrew/bump.mjs) — do not edit them by hand.
class Radial < Formula
  desc "Script your Radial issue tracker from the terminal and your agents"
  homepage "https://radial.build/developers"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-darwin-arm64"
      sha256 "2ba0d7f19e831fc72b57aa32c2fca19c62af9baf2812553fb5fb6882f124d3f9"
    end
    on_intel do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-darwin-x64"
      sha256 "18874c8c18eb55a2e3533412dc86d576c791d44e75c0f38814261a4debed1898"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-linux-arm64"
      sha256 "68f9c02b4f3639e32e3dc8ad4d53d384c76781778b21870d49f8675673a14aa5"
    end
    on_intel do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-linux-x64"
      sha256 "6103d11aee9fb21fb925f575862310ef682939b0221059b17574fd5aabda06b1"
    end
  end

  def install
    bin.install Dir["*"].first => "radial"
  end

  test do
    assert_match "radial #{version}", shell_output("#{bin}/radial version")
  end
end
