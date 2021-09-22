class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.8"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.8/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.8/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "cca4a3887017cb515b9e991b4371a7f692dcae0e49d0305403e48bb97fd20853"
  elsif OS.linux?
    url linux_x64_url
    sha256 "4a2a9e5c142b6801417bedac9b5b8e608cb8d71be0213d4af18db9e11edb3c7a"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
