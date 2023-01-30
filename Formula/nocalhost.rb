class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.20"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.20/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.20/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "d019de2b3968cd82430714ef1d7b184b02483e16c91c1a68c50cfbc1f79903d9"
  elsif OS.linux?
    url linux_x64_url
    sha256 "32f98c6965817f406c2a8dfa676c4591d762548718b105146e7eedb3889a18a3"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
