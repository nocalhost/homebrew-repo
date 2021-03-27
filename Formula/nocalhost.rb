class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.4"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.4/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.4/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "34da6c6b4c7edf7ba200fc4333cf82d51e93922eee9a4fa3e9c033710ddf4b81"
  elsif OS.linux?
    url linux_x64_url
    sha256 "31d1038e9f1efa0af95f26968b12d6947fcbaf8e73b15226cd97a2be79f69932"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
