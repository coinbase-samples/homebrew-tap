class PrimeCli < Formula
  desc "Coinbase Prime command-line interface (CLI) "
  homepage "https://github.com/coinbase-samples/prime-cli"
  url "https://github.com/coinbase-samples/prime-cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "8d82554769cccd4d7584832daf25d09fb6a9d0e91dc95a0267b1f9f5075e41a8"
  license "Apache-2.0"
  version "0.5.0"

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
