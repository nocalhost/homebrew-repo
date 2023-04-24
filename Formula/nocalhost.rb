class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.29"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.29/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.29/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "3aaaee752f4b900bbde9dd01c8fe7ccb9aff496a6456e4d06e7587eb065031f6"
  elsif OS.linux?
    url linux_x64_url
    sha256 "75e1a4cc9b9b3e5447e1b7a8257f427d913baa861e405a56c3808b1b219e101f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
