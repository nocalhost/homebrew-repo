class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "bbfd4ec6ec08a7abfe0c6c918d3a973909abbe1f69c023ff41a9d2694a098b56"
  elsif OS.linux?
    url linux_x64_url
    sha256 "800b1608547b3dd86d02380090b6026ef2bc7490a033af94d292ef813e5fab03"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
