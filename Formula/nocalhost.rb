class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.16"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.16/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.16/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "28a5f090bb2bbcb0309550bcdf4329aebaa30d1ad330b3def0157886201f58b1"
  elsif OS.linux?
    url linux_x64_url
    sha256 "2263baba1d5bfa5f62d060e4aafa71bd3319c46f17c6d400bea241b04b592c2f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
