class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.25"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.25/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.25/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "a1716ccd505442bd9b73d5a0f16196b625c2b9f52e243623223a01136c5a86cf"
  elsif OS.linux?
    url linux_x64_url
    sha256 "984979bb187f6947b3d20b84a825ec4e71a94ef3e8885baa8bd2993b736eb37e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
