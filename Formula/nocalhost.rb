class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.21"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.21/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.21/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "f1485f0d0a6f4bed77c60911be8be602a2943b2d2d4512935833a64d9120a592"
  elsif OS.linux?
    url linux_x64_url
    sha256 "dc05255a15e5b67fbef6b7eac8611b19fe40ef2f02ec63cb6a423aeeb35550b2"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
