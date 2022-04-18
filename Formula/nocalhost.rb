class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.18"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.18/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.18/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "ee6aaa400f94f2cf83f826feedcc18db83b0d0aa1af7578410caa92249dc1ff5"
  elsif OS.linux?
    url linux_x64_url
    sha256 "2ed7dc064913029536ad3b748311eee74692ae567476392e942653bccf8a5da8"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
