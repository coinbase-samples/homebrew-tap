class PrimeCli < Formula
  desc "Coinbase Prime command-line interface (CLI) "
  homepage "https://github.com/coinbase-samples/prime-cli"
  url "https://github.com/coinbase-samples/prime-cli/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "f614296167ce0f70fdac735c7f6a481b7e1111b9c4c436b289e01aa2d4a74515"
  license "Apache-2.0"
  version "0.2.2"

  depends_on "go" => :build

  def install
    system "go", "build",
           "-trimpath",
           "-o", bin/"primectl",
           "-ldflags", "-s -w",
           "."
  end

  test do
    assert_match "version", shell_output("#{bin}/primectl version")
  end

end
