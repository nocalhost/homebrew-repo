class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.11"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.11/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.11/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "8ccb5ece222b3d8fe11190934adbe48a3b53843e4759e636dbdb4cc0cf3abb0f"
  elsif OS.linux?
    url linux_x64_url
    sha256 "f2ca6bd774486dd61db6b717b1959eeebb9106f00fb087c8a7812aeefb462e0f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
