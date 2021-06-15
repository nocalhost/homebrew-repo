class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.9"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.9/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.9/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "40b5f78ba218375be7d6b756b581bb2189ea1173067dfe6199001cc3c0e430d1"
  elsif OS.linux?
    url linux_x64_url
    sha256 "96eed059728f5c46f144e9d87e51216c18f6dfa92bbec42ef809ac5215e02f0f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
