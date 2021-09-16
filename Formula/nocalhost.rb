class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.6"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.6/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.6/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "4e937fafdca678ba4925950978f0645302c808b2e8b5fff02dca3d9958497e68"
  elsif OS.linux?
    url linux_x64_url
    sha256 "0d6e373025d872b2c9698526ad034ea55834be3ccab7a8f5503bfe7e5462ca92"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
