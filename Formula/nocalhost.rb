class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.25"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.25/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.25/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "1a6b233ae396dd3ba12a67c0a6cc889f0680b96c7becf809a42f8187cd5e08d2"
  elsif OS.linux?
    url linux_x64_url
    sha256 "1c720dbdbbbbb124ea00f09da8a0ef9ce5182c11642e3337ff3e9aec2a0ec321"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
