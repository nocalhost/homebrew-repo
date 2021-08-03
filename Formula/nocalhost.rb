class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.20"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.20/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.20/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "cf80a560824d645df6437f22662250ecb94fe733abe2c8543f83a7706f6d75b4"
  elsif OS.linux?
    url linux_x64_url
    sha256 "6e7f34ffe9cc1e7c628d7ac324d03cbb91498f0d848b1aa6ed267c9bfee72720"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
