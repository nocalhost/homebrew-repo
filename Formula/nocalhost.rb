class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.18"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.18/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.18/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "f7f143b2d7e303cc5f73d95b941a4b50e6c9aa0d242219ce5c078f3679bb31ea"
  elsif OS.linux?
    url linux_x64_url
    sha256 "2f2c5f95544515f1530f3c88d1c15e863afd811efbca70f0bcc4d99bb69070fa"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
