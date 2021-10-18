class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.2"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.2/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.2/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "8feb015c62210df56badc85ef7ad4200fe21efdb2f6a45d5f1780d1ab6b0323e"
  elsif OS.linux?
    url linux_x64_url
    sha256 "27b19c0e3cf799610ee1123b2a988aa368a9e015034985cd5b7228478687d6de"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
