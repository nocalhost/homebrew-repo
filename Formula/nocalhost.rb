class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.5"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.5/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.5/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "47e62edf79362f7780a270e15968df7f405f061c96f7b398f16b20d661ffdff4"
  elsif OS.linux?
    url linux_x64_url
    sha256 "d8973feaaa8e93cc5b699528ce5daddec4b1ac5388b7638d5781ad12822866e4"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
