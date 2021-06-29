class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.11"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.11/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.11/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "14d104ab28a1ae3b6f6f528e485ea402d95d80f05cd50ae2b5992a7d09acf58a"
  elsif OS.linux?
    url linux_x64_url
    sha256 "6856f3382f66d15d2a9469003854f5353ce37e8c329ee53221f074efee758bb6"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
