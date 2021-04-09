class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.7"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.7/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.7/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "b9a6a0a33d01e6d66781887a507f54752e6c7bbffc7668e0287985d75d223ef0"
  elsif OS.linux?
    url linux_x64_url
    sha256 "11b2f6a902a4fa1d045bad0040cccd01ace716d29e1c6a1e9d5cd9d6469c89b4"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
