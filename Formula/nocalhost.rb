class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.7"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.7/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.7/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "bfd59e78af268f46a7edb4dcf3429d0af058f159f1d70dbe213f672b15251166"
  elsif OS.linux?
    url linux_x64_url
    sha256 "e3bf123d7735cd982abd1569d5962867b7e5d6b243ee87a29444d0689366efa1"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
