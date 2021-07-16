class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.15"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.15/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.15/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "46a12b71349db00bdb32f8667a69ff3ddb8e5ca47772fd1a3a72dc39f301f892"
  elsif OS.linux?
    url linux_x64_url
    sha256 "8bf38a43775559b83375294fb6a36990cf71c6faf5573240ec2d3de0a3dfd241"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
