class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.23"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.23/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.23/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "935ce9380e535e292faa935bf3a4d0dd8789e0aa43d6e016a26c21b1438d2b40"
  elsif OS.linux?
    url linux_x64_url
    sha256 "8aa24e3573219eebdf22d1bbfc6ebb632d4b7311826b94c270cc4ec1f3acb221"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
