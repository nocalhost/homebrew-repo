class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.1/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.1/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "42a05b1c7f6cf505014249a6367d2c4cad909fcc12db39e97f9212f4a9661d00"
  elsif OS.linux?
    url linux_x64_url
    sha256 "a801e05b44a6d653e0b1e41bf818c900963969bcbe2e20fa7b908a807760adc6"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
