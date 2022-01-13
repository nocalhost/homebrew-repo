class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.13"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.13/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.13/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "d71724f5b9b469b4b202c5fd8f9c18b6d8a10863918c936483b3b19f469fac53"
  elsif OS.linux?
    url linux_x64_url
    sha256 "c3aec10a13f54685368b139a1b01c73186be2a127d60080fb3670ecdde3a57e9"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
