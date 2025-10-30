class Agentsync < Formula
  desc "CLI tool to synchronize AI agent rules for LLM platforms"
  homepage "https://github.com/kylejosterman/agentsync"
  url "https://github.com/kylejosterman/agentsync/archive/refs/tags/0.2.0.tar.gz"
  sha256 "f56aa9dddf588117e3d79889583b80b032c2cb3d5288cc72b67c33bad583992a"
  license "MIT"
  head "https://github.com/kylejosterman/agentsync.git", branch: "main"

  bottle do
    root_url "https://github.com/kylejosterman/homebrew-agentsync/releases/download/agentsync-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "87bd1a0b7c6d029a23f0e9efbfd5ec84ba0c7f6e4ad4e3cc7c08982fa782ed4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3d841acfa3da23c35515d32f86fafd4d9e671630a6edaa8ff4247252c99343d7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentsync --version")
  end
end
