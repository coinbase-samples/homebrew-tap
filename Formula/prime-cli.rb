class PrimeCli < Formula
  desc "Coinbase Prime command-line interface (CLI) "
  homepage "https://github.com/coinbase-samples/prime-cli"
  url "https://github.com/coinbase-samples/prime-cli/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "1c27cf8bc0c5fe8f0a7e493c14c7feb8de0700df532cd9abda4564995657dc75"
  license "Apache-2.0"
  version "0.3.1"

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
