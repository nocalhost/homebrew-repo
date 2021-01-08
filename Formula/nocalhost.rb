class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "58ed5c958205512072c17e1ea01714c0229705e6412c327bb93a9b62a437ae27"
  elsif OS.linux?
    url linux_x64_url
    sha256 "844bcd96611eeaae3d29692db08cb2e20a77ad3042a417ae65fb0a42b5c21f3c"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
