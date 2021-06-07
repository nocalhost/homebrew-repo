class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.8"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.8/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.8/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "0dd7d8b66eae1b9f2a3ba50b7d6001d9f9244ce77e987836b72fabf7bcd2d362"
  elsif OS.linux?
    url linux_x64_url
    sha256 "627587dea3c32456ee2723e9edaf46a195b3453404270816104ffc137ec92816"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
