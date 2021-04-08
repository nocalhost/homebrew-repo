class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.6"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.6/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.6/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "a4053824f15f469480d93e4ce2f23ee7530536affdd3bdba0d4abeb3f07c1a23"
  elsif OS.linux?
    url linux_x64_url
    sha256 "6bcb75cd93cfc2fae1cee551d53e7e55097b158349a312d24f78b7ae5c2efab9"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
