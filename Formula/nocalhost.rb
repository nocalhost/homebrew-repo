class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.23"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.23/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.23/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "f3e12581ec6a6da28f9fc289a444e9046b3a71c13b06ecc607461b6fce1e84dc"
  elsif OS.linux?
    url linux_x64_url
    sha256 "7e67ef50143940823d0ef2a23f19e3c0b40611dad8496f1590a6458fdf8a0945"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
