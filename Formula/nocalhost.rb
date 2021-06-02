class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.6"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.6/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.6/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "f264d4228307c1893a5a0d15cb4b7d7bf8fe9cbc1742e40ffc2b95ea55e2edfd"
  elsif OS.linux?
    url linux_x64_url
    sha256 "dc44623a75a06bfaf245d7151c7b1933f5fa2c00eacda66d4bd04eac3f997227"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
