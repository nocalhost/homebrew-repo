class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.9"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.9/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.9/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "df934f81ec243760e7341e31ed7106a581fb3289b481c1047fc3835d97094223"
  elsif OS.linux?
    url linux_x64_url
    sha256 "c04ac37daf814a73703fdf426a93f576fb57537aa41ae1d60cee5db3d32cec5f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
