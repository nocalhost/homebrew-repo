class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.4"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.4/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.4/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "501723e3860bda79844ff4250b56a2773f1791a6b81d276fb2fe5118b3e4ed7d"
  elsif OS.linux?
    url linux_x64_url
    sha256 "b75415df34a0ea3a95581ac695c11f8fecb083f797aefb0d913aed7dc28605eb"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
