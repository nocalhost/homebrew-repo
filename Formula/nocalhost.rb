class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "7cfaf6948014b065698032eaa55ae8b65e810a8bceabed70dd5f786fe8215a20"
  elsif OS.linux?
    url linux_x64_url
    sha256 "4c2a2a73fb979aba5fda70c652a4d5c6b363f5775259f4350bfe49d65f61118b"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
