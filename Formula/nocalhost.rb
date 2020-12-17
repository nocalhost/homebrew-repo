class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.13"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.13/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.13/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "1562aa76a6492bd03323ab67b0b64453ed28ab1c840942c5d2c6942585ee24fc"
  elsif OS.linux?
    url linux_x64_url
    sha256 "30a0862c9083ac767e93dc027443ec9342eeb1a33186b03630d102286c783659"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
