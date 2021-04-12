class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.7"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.7/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.7/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "8bc2e52e74cfd2f0680c55507533028ffd555e6f9e5c1224773fce19ef515a07"
  elsif OS.linux?
    url linux_x64_url
    sha256 "0197565b71f72b992cf3b3d257f45e536ae0f97fca7561f5748b15310e5a9ca3"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
