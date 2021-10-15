class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.1/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.1/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "36e3a2ecfbbfc2de298e70d6e4a92c9a9bbb9c81db39804f84af46c6567040e1"
  elsif OS.linux?
    url linux_x64_url
    sha256 "9d0eb6bc8b32a02ede2b1a3c94897b9f4a77b54dd6a9dc716ea030f185dde248"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
