class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.10"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.10/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.10/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "2049ac220ebb9b1bca0fa2f20e1973f4980d1f8edc2c52299efc8a8870619bb3"
  elsif OS.linux?
    url linux_x64_url
    sha256 "0ed8f1913d684bc651812df88cf707097ec911db02a001f55934d514b5e8067d"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
