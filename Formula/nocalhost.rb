class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.2"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.2/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.2/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "74a0ada3ae32ccd0e4a35c268c9f3128613ef69a1672f44b2683c2503df4b087"
  elsif OS.linux?
    url linux_x64_url
    sha256 "1a185bde1c350071e33759988c450e5502caa2a4632f9126397bcc3c8311c5b1"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
