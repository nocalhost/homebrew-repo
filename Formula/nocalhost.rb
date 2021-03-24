class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "c33428e7bb67e68b359ab8a4097a8b615140b67e1cebe0ad3d4512ab5b3d7db3"
  elsif OS.linux?
    url linux_x64_url
    sha256 "cf29d37f3c369b6028bcce713f090865634e5c90324246dc98d059d82e4500df"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
