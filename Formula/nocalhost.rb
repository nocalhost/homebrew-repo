class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.8"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.8/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.8/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "e839b3545d646ebf20b7d655ec4245c9beeeebc9ba5ec48212869bcbcf54952d"
  elsif OS.linux?
    url linux_x64_url
    sha256 "d75f699a563c4556480358589f7a91b0fa7e8f69c6aa3a961f0a88cabb497d32"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
