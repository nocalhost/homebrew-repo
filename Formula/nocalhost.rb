class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.28"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.28/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.28/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "b36e91459b8b1dd023f5dc2d36c571eaa5595e5f15ff8a4fe8ce3089bcbce52e"
  elsif OS.linux?
    url linux_x64_url
    sha256 "5d160ad765cb01615099305bfcc58f113e519ea14a0eb8dff75d3b4742612d9a"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
