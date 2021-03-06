class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.0"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.0/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.0/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "7233c59568d4ddc9206f600931f33c0465eb50ae75f675b046afe950d408eda9"
  elsif OS.linux?
    url linux_x64_url
    sha256 "a8f2e449661c7cfd5c2731913aebe78c3e302de725579aa5c281022784a46c53"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
