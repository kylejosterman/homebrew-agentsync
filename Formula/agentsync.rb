class Agentsync < Formula
  desc "CLI tool to synchronize AI agent rules for LLM platforms"
  homepage "https://github.com/kylejosterman/agentsync"
  url "https://github.com/kylejosterman/agentsync/archive/refs/tags/0.1.0.tar.gz"
  sha256 "d0b9ae66502bc91d012b0fe54761fe1f5332f9e39bfa2ed9ea5282f33aa08886"
  license "MIT"
  head "https://github.com/kylejosterman/agentsync.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentsync --version")
  end
end
