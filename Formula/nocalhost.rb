class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "7804efa2200a3a35d686a7c59622ba16bdd8f5918a6d0f1ef8bb4c265d13fe4a"
  elsif OS.linux?
    url linux_x64_url
    sha256 "1317844e29dcf5291ebed3363f9cc9b2eaa7395f69027c52b0c146115dadbe47"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
