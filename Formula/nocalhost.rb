class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.6"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.6/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.6/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "3f7341bef05eb4e999d608e35f85f353357a629420c1d450d9b272bb40f67df9"
  elsif OS.linux?
    url linux_x64_url
    sha256 "cf8cd49e1a9688892e9cb4ee1974677d14906ee466485a21952f9643b087d5ab"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
