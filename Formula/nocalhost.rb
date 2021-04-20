class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.8"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.8/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.8/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "76d5bccaa3dd84bbec30ecba683056fb138838e87e219ba373188c72f06bd181"
  elsif OS.linux?
    url linux_x64_url
    sha256 "c95af3754d886907cebcdf20652e27a8b859343ef5e00d827dc697a8f59c0572"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
