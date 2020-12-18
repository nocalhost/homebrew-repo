class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.1.0"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.1.0/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.1.0/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "3525d93bccb4f03e072a92443f6d32b8d16e17816196554028d1b5f0905f12c8"
  elsif OS.linux?
    url linux_x64_url
    sha256 "f2cf11f4ea6447385746bc404d28769de0e17144a4ded8a8c0f9e4659153a7e0"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
