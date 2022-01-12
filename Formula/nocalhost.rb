class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.12"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.12/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.12/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "645fe3009ba39ecc5c941786e7ce932b165fdcd8f2a03aff479316146cca83cb"
  elsif OS.linux?
    url linux_x64_url
    sha256 "db292cf1d232da733d5d0573131402e4eac59ea45cb1aa9d634fee4e0e3d5d57"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
