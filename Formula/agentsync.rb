class Agentsync < Formula
  desc "CLI tool to synchronize AI agent rules for LLM platforms"
  homepage "https://github.com/kylejosterman/agentsync"
  url "https://github.com/kylejosterman/agentsync/archive/refs/tags/0.1.0.tar.gz"
  sha256 "d0b9ae66502bc91d012b0fe54761fe1f5332f9e39bfa2ed9ea5282f33aa08886"
  license "MIT"
  head "https://github.com/kylejosterman/agentsync.git", branch: "main"

  bottle do
    root_url "https://github.com/kylejosterman/homebrew-agentsync/releases/download/agentsync-0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e0f30b0d05729be80e8e6c2722c4ecebe24c26ee783deedc175b0d97b528e17e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "329357d52a3faf8aa6476b32cff6557b90e77518a678af601c39929afab2fac6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentsync --version")
  end
end
