class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.4"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.4/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.4/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "dc2af41fefb4f58d6862be08b717062fc3426197f80b3d21f7c5c501471308bd"
  elsif OS.linux?
    url linux_x64_url
    sha256 "8ba7120f17df5cc581eaa54bd4288e7f6bd689fb19ea3aec062884dc19f5670c"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
