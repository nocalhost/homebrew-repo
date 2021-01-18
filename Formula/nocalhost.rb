class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.5"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.5/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.5/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "0b1beb44994448bc76f586e5e3f3be91fa12866854fc94c3a3ec34514aaa5bd8"
  elsif OS.linux?
    url linux_x64_url
    sha256 "d8e4a9bc03baac8c9406ac520f1d0555a999a195f03adf476fa8d380179578c5"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
