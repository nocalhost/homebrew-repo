class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.15"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.15/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.15/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "af70babf6906c79fae70ae1aa41da4b3ab15d9bc5a15f78f9ac7be93cf50d444"
  elsif OS.linux?
    url linux_x64_url
    sha256 "746ddbb342dc28096ab34b314ea154890704bbc604fadaa5847f2a7887df1af4"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
