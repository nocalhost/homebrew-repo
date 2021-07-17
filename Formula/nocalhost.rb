class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.17"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.17/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.17/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "8ba25d3a5e0912d6d51f5b10c8b4660492746f5f5cacb14ef3d47d3460f008ce"
  elsif OS.linux?
    url linux_x64_url
    sha256 "d299a94a388134798bc6f4fea6c28f852a157a8fa0fc1d576b3609c7260f9d9b"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
