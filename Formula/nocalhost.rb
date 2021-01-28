class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.8"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.8/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.8/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "a9310b20adcd620d03b223e58eccbb886aa31e5fdb79b76e04acf1235ea4d0f7"
  elsif OS.linux?
    url linux_x64_url
    sha256 "2c179e536cd64b2485224b952ca9dc2db3857cbbfe26e72414c7bb1bb76c666a"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
