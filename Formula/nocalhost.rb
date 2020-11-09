class Kapp < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.1"

  darwin_url = "TODO"
  linux_x64_url = "TODO"

  if OS.mac?
    url darwin_url
    sha256 "a9c1a09c257cb94ac368916caa9c3092cf06297c6da82a0e55e570af8f04d33c"
  elsif OS.linux?
    url linux_x64_url
    sha256 "a9c1a09c257cb94ac368916caa9c3092cf06297c6da82a0e55e570af8f04d33c"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
