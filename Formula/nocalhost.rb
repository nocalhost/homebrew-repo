class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.7"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.7/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.7/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "319d699fcfcd5295b8ca8adf188c4223de47ab1f930401e225ba8cad97200dcc"
  elsif OS.linux?
    url linux_x64_url
    sha256 "acbd8f0e3cea64e373c5f2d363b1531f768bcadffcb9dc1108c65e6db97b8d62"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
