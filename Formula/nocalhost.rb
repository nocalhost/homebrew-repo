class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.1-rc2"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.1-rc2/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.1-rc2/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "66883b1f14f3ff7aae96c37b148197c60747c7be9aa923a5ca13d5ab97706d7e"
  elsif OS.linux?
    url linux_x64_url
    sha256 "717cffdb18eb495f09a5d833e729b8169e3e0671b77622c8f945faafb8fd0f61"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
