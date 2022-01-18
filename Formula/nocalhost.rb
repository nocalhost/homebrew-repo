class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.14"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.14/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.14/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "be262256b208647f4f0845865527acb901c27359d52e104dc1a92cb51cbbfe0e"
  elsif OS.linux?
    url linux_x64_url
    sha256 "abc69541172ccc68e3bd9c4057d1e5a5a9f8681711aff4176a2ea795204b7b7e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
