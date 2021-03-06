class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.0"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.0/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.0/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "7509ed746275731b03cce8fc3880ce058bb872d1b9220a8e3bfb7e23d49c7041"
  elsif OS.linux?
    url linux_x64_url
    sha256 "a32673b673beb97c1544fdc7de9613593d66cc1d0bee32a0fb7f99ad9cc8b94c"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
