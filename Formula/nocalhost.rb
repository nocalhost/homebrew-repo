class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.19"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.19/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.19/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "c28b5a18685792cb909f04c9d794e1a1f0bfa2bf30e1789bfce55e74cd996762"
  elsif OS.linux?
    url linux_x64_url
    sha256 "5b2532ea63dd19ddc461937202195256821283b5158274f6da0dd0ae306d02a5"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
