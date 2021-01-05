class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.1/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.1/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "bb13b610a3c8565a914eee04d6ad64f159e24e162d1010381437c2ce5e20b257"
  elsif OS.linux?
    url linux_x64_url
    sha256 "f684423b8fef2f552bf4b8b6f399b09fb96c6c650f9e6045ed9a15c42aa1ca5d"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
