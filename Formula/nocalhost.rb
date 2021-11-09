class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.5"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.5/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.5/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "b1c518516004e6f219ca6452c2ec62fb435a478c669dda1f1e9871177eed0404"
  elsif OS.linux?
    url linux_x64_url
    sha256 "ecbc2ca04da4277c5016b5b4e8585bcfd88d5023fb0b751b2d13b2e46bc8ac4f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
