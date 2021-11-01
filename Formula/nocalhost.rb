class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "919693439fec8d593237affdf02b127105808f438049dd5725435f3a09096ed7"
  elsif OS.linux?
    url linux_x64_url
    sha256 "43281bdfa9b6680f8480a62f2badcbf64e92981f4bb6cc5d0a80aad04469f9dd"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
