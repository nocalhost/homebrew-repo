class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.12"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.12/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.12/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "8b6d0652b1dc04ccc373d86fed0e98ca577610f7b4b7601918d82c28a2f4dbdc"
  elsif OS.linux?
    url linux_x64_url
    sha256 "0c56f45688fdd30ce2572d49e70b513124d764e1f0d3230a409c604622850079"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
