class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.4"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.4/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.4/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "80893c9b5d04f73025733c94ba7bfb085e207f926d2145f907f0475496a50bbd"
  elsif OS.linux?
    url linux_x64_url
    sha256 "ab19bb6d58d48148684b1837b8a6613a718e0ceaf6866980acc22bda468eb877"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
