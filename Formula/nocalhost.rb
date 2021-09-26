class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.9"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.9/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.9/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "04bd00f65062a8670d13d8e254d517d6caf5d364eeed1bb3ad6a1ca9faf2f692"
  elsif OS.linux?
    url linux_x64_url
    sha256 "17e314863a244077be5f857a051012089fd755d8a9cbe9516518ab75e7e2184f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
