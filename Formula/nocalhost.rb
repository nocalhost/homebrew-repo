class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.16"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.16/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.16/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "40820b4d9b3778cfb4f18ecfb87c89d3928cccda02f92c794fdd636d161cbf7e"
  elsif OS.linux?
    url linux_x64_url
    sha256 "1a082c383e45acb8537873e3251cbb92e0267c1e604ddccbb415f3e5936fb63e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
