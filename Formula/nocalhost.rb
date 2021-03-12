class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.1/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.1/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "95e24c1e12092f1adaa4a386242805527355e5bd82a824e2a49c684f59de4d53"
  elsif OS.linux?
    url linux_x64_url
    sha256 "bae2bbf5b8cd88bdd997e80e98df1b3c964306d53c7ca8f2a0e48c9fafb54a23"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
