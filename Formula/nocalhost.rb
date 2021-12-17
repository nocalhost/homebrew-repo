class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.10"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.10/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.10/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "81bd315bea3b5a2d5f768d1d90fac8e45338b8d2f462a935fd3391764c2eb20c"
  elsif OS.linux?
    url linux_x64_url
    sha256 "783ac507c7ae06860ba5e2cadf77c7441d7019467c9bef805214a7bcb1d3519b"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
