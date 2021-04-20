class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.9"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.9/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.9/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "59e1b7e9de162e203922b278137f9745a890dbb49a8f0b69635137cb18e507be"
  elsif OS.linux?
    url linux_x64_url
    sha256 "80180fb0aa5d8c42f72642c1cc78bc0dc4f3a8402532eaba5d64d84d6e448047"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
