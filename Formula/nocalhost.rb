class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.15"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.15/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.15/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "fab23606397b94217c9bf6ae4869b5fa016d7eab8c14a299e906ca953fc11895"
  elsif OS.linux?
    url linux_x64_url
    sha256 "619aabbf3e2ad14fee758a12cdca94c6d470aa7f3bd74675a28352ef591c01bf"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
