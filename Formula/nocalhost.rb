class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.6"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.6/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.6/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "60a25ffb5a9e90915ddb52af3dbab38d69156f1ff71a97cafb0fc5351b93687a"
  elsif OS.linux?
    url linux_x64_url
    sha256 "760039b89ca87d4070185907655a87dff6540b1c9e33db15410d38d276f6ed59"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
