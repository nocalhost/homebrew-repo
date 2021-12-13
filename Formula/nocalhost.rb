class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.7"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.7/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.7/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "6d3ec932158b9b59fddf6298db449a850b95303b0ece69c16fd7a46e8ea4a0d5"
  elsif OS.linux?
    url linux_x64_url
    sha256 "3cf574c74a0d58a1807ed71b605f4d5b9cb8c22e1589c5669ab046600cc02e07"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
