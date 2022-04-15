class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.17"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.17/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.17/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "847c34408e9da542f7e19deb568b199a7f8f50ad5bbbc5e4a12e1d030a34d5c4"
  elsif OS.linux?
    url linux_x64_url
    sha256 "07f11693c380cda575a0ed1a3eef02d83d0d33b8b4b34e310ae9b9eb9c069333"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
