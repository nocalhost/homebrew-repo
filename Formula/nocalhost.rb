class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "68cda2462a274863a57881cbca808e85fd802eeea1f55709bd8d551246c16043"
  elsif OS.linux?
    url linux_x64_url
    sha256 "5a093b025cb0a6d8213aa632975cdef2c0dbb78b83ce51a40f5b191ff8cf2c13"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
