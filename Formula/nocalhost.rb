class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.0-rc2"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.0-rc2/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.0-rc2/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "9c261178156527fe7506f723a43b35a1793d69706392b10eed5e777615ba60d4"
  elsif OS.linux?
    url linux_x64_url
    sha256 "bb93ef7656ba8959f6339306a44c034c71eea8c2bd18107f1629a56a956b187e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
