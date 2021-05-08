class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.1-rc3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.1-rc3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.1-rc3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "be2a0c768686e523542d5d05dc6b9883097ac6fc012303b6cf6ae4943a28b197"
  elsif OS.linux?
    url linux_x64_url
    sha256 "3a05e96ef1c71bfd7c0129f4e10aca4251a888316c40878ae7e81d1949c81139"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
