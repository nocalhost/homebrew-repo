class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.0"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.0/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.0/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "20bc8bd2793987d0216417f99cda4da06e954ecf26ccc6bb780bfa16708921ee"
  elsif OS.linux?
    url linux_x64_url
    sha256 "37aacb1b9f62b61a44f3df55889dab408d7cc655313eb5e621cbd6e3de3aa5c4"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
