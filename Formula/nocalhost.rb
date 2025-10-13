class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.32"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.32/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.32/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "ee2620e1a79e875278f9bf438053823e757de18a4e9aed052e626379ddf4bbec"
  elsif OS.linux?
    url linux_x64_url
    sha256 "bf4e0ebe730a75f5774f9900929b26856d717976e1a6c77ef7cc478e06e7e331"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
