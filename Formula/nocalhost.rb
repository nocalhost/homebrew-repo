class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "b8c074ad22f0e1fb6dc586a3ad7683806f6f8ebf7aa9caf5d1108e3c08a9d14b"
  elsif OS.linux?
    url linux_x64_url
    sha256 "8910d5abd11db048ce6d6f4bc141e5a621600bcdbaa81fd3553ad39570ebbb0e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
