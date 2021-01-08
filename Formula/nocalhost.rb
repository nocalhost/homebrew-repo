class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.3"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.3/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.3/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "fee9ae97b0a73eb36f3f3cce8bb02e79b4e19541364be479fdcb1ab408c27492"
  elsif OS.linux?
    url linux_x64_url
    sha256 "ac0a06a514aee2b6fc03568c59946ff91d6daf28eb372cdabfcc1dadc743b577"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
