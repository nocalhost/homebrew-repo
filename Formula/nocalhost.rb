class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.5"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.5/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.5/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "b32bb716c996da4069e4cee31d212b26007e2595397e15c21c5f6635d39c9d6d"
  elsif OS.linux?
    url linux_x64_url
    sha256 "0568cd6f89c199ae92eb3b61c4d0cbdd95b19f00bb529a2d026b680e57990ace"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
