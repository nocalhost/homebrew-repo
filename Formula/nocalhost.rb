class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.2"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.2/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.2/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "53ec31ae290bfe60478650069c26325d34cbb072f3af90bf3d91608554e57377"
  elsif OS.linux?
    url linux_x64_url
    sha256 "7ce4a032dd02519ccbfa8615c321ad5ab8ec01eed8d3fa6479b3ae9578c63c9f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
