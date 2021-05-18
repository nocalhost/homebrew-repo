class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.1-rc8"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.1-rc8/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.1-rc8/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "94927c7ead9a9d4e0b68e30382096fd3da2c2c8e1cc1ad836a3a2dc0efaaf898"
  elsif OS.linux?
    url linux_x64_url
    sha256 "67fa0f31ffcc25c7cb4a5d51bccc61ff9fd7e53f3d850a7d607dee492b26bec3"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
