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
  version "1.0.4"

  on_macos do
    on_arm do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-darwin-arm64"
      sha256 "095bc0e894d82a4b42def865f28790befdb0d2b4e12e93a3edf99cafd552896e"
    end
    on_intel do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-darwin-x64"
      sha256 "560b54d9f9382cf7637f42fb73e8bbabc6383415504cc2f6afbc25c91ca7c794"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-linux-arm64"
      sha256 "51e0cf22888e4441b37eb691e5d0181372224cd1d757a02a9169c8da65ad3def"
    end
    on_intel do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-linux-x64"
      sha256 "b83470cd092025bb420fd8a898f1bd8ac28aedddba1aa0d6ee08c72999a69892"
    end
  end

  def install
    bin.install Dir["*"].first => "radial"
  end

  test do
    assert_match "radial #{version}", shell_output("#{bin}/radial version")
  end
end
