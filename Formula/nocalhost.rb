class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.0"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.0/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.0/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "fcc01c5cfccdf1c683802ba960c778141a97df51d02b6dc56830b470a5d48e28"
  elsif OS.linux?
    url linux_x64_url
    sha256 "64ebf6dbce858fcef068d831756fe75a3d5301463b4fedc4c666b3b461f8eab9"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
