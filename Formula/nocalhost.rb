class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.6"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.6/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.6/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "32e4ef78eb44530314abfb91d7d8567b54b44605743143c12f2e99a6f4e08345"
  elsif OS.linux?
    url linux_x64_url
    sha256 "630aed43e76cee257ee1dfa2b7b0fe6c0166893675fa84c3ecde59568bfd81f4"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
