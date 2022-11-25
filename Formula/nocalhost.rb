class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.19"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.19/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.19/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "13385bd972c3f7159e729a5940c9f0acea246e66b51a04ce8900040a681dc952"
  elsif OS.linux?
    url linux_x64_url
    sha256 "8298fe8b99bce1ac98e45ebc57f89258e069911696b4a439dba73b78ecb54c3d"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
