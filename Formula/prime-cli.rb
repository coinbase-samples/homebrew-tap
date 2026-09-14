class PrimeCli < Formula
  desc "Coinbase Prime command-line interface (CLI) "
  homepage "https://github.com/coinbase-samples/prime-cli"
  url "https://github.com/coinbase-samples/prime-cli/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "7a89e447d242f64359e1fb31bb3b7140da08334112230d78581c09f895c7fa30"
  license "Apache-2.0"
  version "0.6.0"

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
