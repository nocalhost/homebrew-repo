class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.4"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.4/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.4/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "c0b0159a7b353176c7a5929f7a2d38da064a16f331c78193c64689a42d23fd9b"
  elsif OS.linux?
    url linux_x64_url
    sha256 "216365f0dd8b0a24a7ac468659796c3a8a54ec54d845f2f0923b23950d813105"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
