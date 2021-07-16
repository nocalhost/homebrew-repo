class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.14"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.14/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.14/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "4a6ce24d760240d1371d5e94c40535974b76fb6931b82dacbde55d6bc6aeaba8"
  elsif OS.linux?
    url linux_x64_url
    sha256 "72d161df04a6fdddabb1a181d0ba50e760ac3820664886a1bf6acda3bf30f175"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
