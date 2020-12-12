class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.5"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.5/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.5/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "dba433b9d3bb4e047374f032757699127724d95f87b922bec5a8b950465e0c55"
  elsif OS.linux?
    url linux_x64_url
    sha256 "436a5c16c554990e6ce625ec3b5ee657ab166097514eed491730416c0fad06cf"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
