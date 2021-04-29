class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.1-rc"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.1-rc/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.1-rc/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "6fe7c1e48cc4973cd0e8f6e6572075b941fcb3d44cae2cc234e8a1373a62d221"
  elsif OS.linux?
    url linux_x64_url
    sha256 "c4f01b05a08bfc19eca4904009ec225669ab9a0dddec98a350f3ced2f56d770e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
