class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.2"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.2/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.2/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "5746179fc649b2d83b09a6fd3bd1932dd6e3ca97c0439e9b694b4e3847c128c1"
  elsif OS.linux?
    url linux_x64_url
    sha256 "1d6c68363ab98a2c7af3ef0ebfaf82698d664f34320c0a7166583fa450d363ee"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
