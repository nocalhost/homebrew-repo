class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.13"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.13/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.13/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "36040a6cfc9bd0a0adc7c656fc57273e3114a224d7f2f97fffbbdefd4d1adf27"
  elsif OS.linux?
    url linux_x64_url
    sha256 "929c9c3bfd841eb01fe025698fa14d4e1e8b0404e6e535e3c44ea60e36f45e5e"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
