class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.18"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.18/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.18/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "43abe07d940eb6c868ac5e34eaa0ec8a8db0dd10489035d6c50839e70bbc89c3"
  elsif OS.linux?
    url linux_x64_url
    sha256 "a575c5617ac5d68bb0151fbd9846d20a4d1091dc149e17430a8cf4545ae1c7e9"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
