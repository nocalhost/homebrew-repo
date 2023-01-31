class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.21"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.21/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.21/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "c1cd41e152e6693ef3e006e1468eab92b267891d0183298803603bf8ee27cec4"
  elsif OS.linux?
    url linux_x64_url
    sha256 "9404df95fe43d0cebf1c10764cdbc6166d53ab168ccb2304528d7e0af97e5dd2"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
