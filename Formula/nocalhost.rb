class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.1.2"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.1.2/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.1.2/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "3740efd9d975b356430ee28803d5b1f636c7005e29ebdb51fdc4ca70e121b4ca"
  elsif OS.linux?
    url linux_x64_url
    sha256 "1f9749065cd76eee669fa50c9427d7b42b862d583eec836da41850d348313d85"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
