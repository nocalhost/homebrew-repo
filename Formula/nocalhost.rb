class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.7"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.7/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.7/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "f798a74f6bebd20d5021b877edcf1a8ff0c637a36c70194affde7d65424ac42e"
  elsif OS.linux?
    url linux_x64_url
    sha256 "c4d4b5dd9c52c55528f3ecdbef7a179b7c6133d319d12ac8a318346a05154d6c"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
