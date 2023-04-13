class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.26"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.26/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.26/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "8836cff364653a54d27402cfc956177f041eeb96639575a229e408b8a042165b"
  elsif OS.linux?
    url linux_x64_url
    sha256 "b5326b14a9ab1edde17addfe1dcd4cc55535dd978fe681c3a1fe51dc0504cf81"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
