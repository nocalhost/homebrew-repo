class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.17"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.17/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.17/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "bb6127287220b1fdb329eef84f9e9a1c289c8e538222a7d069c5510c223e814e"
  elsif OS.linux?
    url linux_x64_url
    sha256 "05d42cb9332d489b969bb28277b837d1a2020818deda525c710dcfcb429dca24"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
