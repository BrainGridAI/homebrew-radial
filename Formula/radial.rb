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
  version "1.0.6"

  on_macos do
    on_arm do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-darwin-arm64"
      sha256 "dd64c8ddf3248fafdb6ed1fec3bfe5ac464b4bf73e7087729cde1292abddc448"
    end
    on_intel do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-darwin-x64"
      sha256 "fedef0c5a18796d478a393828fa0a38a59d138a28727f248cd9f1e746f5b6db2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-linux-arm64"
      sha256 "433fc6f06f1c4c305012609ffcbdb7f3c9f542a04bd78ea2795e3466ed74dc8a"
    end
    on_intel do
      url "https://github.com/BrainGridAI/radial/releases/download/cli-v#{version}/radial-linux-x64"
      sha256 "b8dc99fb64d15db2ca5decda4fd89e8e37e14522e42d60bfd9d0a970f766cd60"
    end
  end

  def install
    bin.install Dir["*"].first => "radial"
  end

  test do
    assert_match "radial #{version}", shell_output("#{bin}/radial version")
  end
end
