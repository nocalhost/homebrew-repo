class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.1.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.1.1/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.1.1/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "0d61bfc19ed00306a4d049e0fd2aafeaba5b4db1bd1007c30a5cc654e42a26e3"
  elsif OS.linux?
    url linux_x64_url
    sha256 "e64b92c9a42bdbfada19526c1fe3ed946969b30d8866ccae6d9a59af7aab5ac4"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
