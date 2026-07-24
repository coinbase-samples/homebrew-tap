class PrimeCli < Formula
  desc "Coinbase Prime command-line interface (CLI) "
  homepage "https://github.com/coinbase-samples/prime-cli"
  url "https://github.com/coinbase-samples/prime-cli/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "1cc3f65a30d31c34b449afe227a92358be93c0a54425b144ecd89b66b4ddfda8"
  license "Apache-2.0"
  version "0.5.1"

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
