class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.4"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.4/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.4/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "0f703976b44165f50a5c9376117cdf03fef5647bc9d1c0349bdb69f5bb0e42aa"
  elsif OS.linux?
    url linux_x64_url
    sha256 "22fee469a59dd5ecb82fd827b476667f70040665853ed683190d8f6f95a99c87"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
