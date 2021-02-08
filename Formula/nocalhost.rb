class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.9"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.9/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.9/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "c399d95fd4b8379085f5522a9d81a68eecedccca699410cecbc04becd1707cad"
  elsif OS.linux?
    url linux_x64_url
    sha256 "a231ada910ac7dff18aaa4294c3766f6f1bd27e4f358043479c9c1fb395c86e3"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
