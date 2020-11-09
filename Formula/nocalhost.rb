class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.1/nhctl_darwin"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.1/nhctl_linux_x64"

  if OS.mac?
    url darwin_url
    sha256 "a9c1a09c257cb94ac368916caa9c3092cf06297c6da82a0e55e570af8f04d33c"
  elsif OS.linux?
    url linux_x64_url
    sha256 "c69c71ce3ddb431117a7e2040914784a7888fca836f3ec33c72a94eac07b8cd0"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
