class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.16"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.16/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.16/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "2612d174f1d39cd21cd2af75f8f395a008044c5c9614aeb43611c5e08b1ba6e7"
  elsif OS.linux?
    url linux_x64_url
    sha256 "eca8ab20b9d5ed233c078c0b5d37afe5a8afc3964c0e667aa7589e0974c50a5d"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
