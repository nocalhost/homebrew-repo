class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.5"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.5/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.5/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "58f755522cef3ddd1f57d7466ec1ee6d540be1f50c0ca0065501d12365d5a7c2"
  elsif OS.linux?
    url linux_x64_url
    sha256 "6e75011a7c9290a0680aef1b69f95fe10cd51edff96348fcdaf064ba20d6a44e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
