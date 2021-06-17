class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.10"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.10/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.10/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "fc49e91f20afe7151510a549d471a07ca013e2d3df71785e9893a6620d8f291b"
  elsif OS.linux?
    url linux_x64_url
    sha256 "65fc21a346ab74ad7ec03c2ac043e3ac0c2955cb8026f1d58602e8c1da0e0a3d"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
