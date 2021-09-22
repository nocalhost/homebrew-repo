class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.8"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.8/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.8/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "93a165ac2ae9ede730858952fc5edb3eaa155976bc25b1d7dc20a7539c86e26f"
  elsif OS.linux?
    url linux_x64_url
    sha256 "55cdcd31b4c069bea0e13bf56d964bf8ad2fca5ae63a09113d31f4bb9edfc9d1"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
