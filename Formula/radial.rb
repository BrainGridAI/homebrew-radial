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
  version "1.0.5"

  on_macos do
    on_arm do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-darwin-arm64"
      sha256 "6db634cff6b859a9ea579484c689536d70d5a49a760b3efb9852c242b80ac370"
    end
    on_intel do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-darwin-x64"
      sha256 "f69335791349e5ea5ebdcd474a7860d10d0182be6eeda7e855d981162f21ee29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-linux-arm64"
      sha256 "55edde3fafc85719e182523284c898eaea8a77fb13e866cd23df03c0a972a4df"
    end
    on_intel do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-linux-x64"
      sha256 "c27b0d95867f903c2f83f5f750c728638f4d56e4f22a8deee605236b82d8a92b"
    end
  end

  def install
    bin.install Dir["*"].first => "radial"
  end

  test do
    assert_match "radial #{version}", shell_output("#{bin}/radial version")
  end
end
