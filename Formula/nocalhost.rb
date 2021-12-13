class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.8"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.8/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.8/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "01e3e719519d1411e13f25de3bacef6c0852828c4f90e85bfe09f61b6139f06a"
  elsif OS.linux?
    url linux_x64_url
    sha256 "0d3628228f81204d63966614d19d7e5120cfc57cac604ef9f99d3d47a84d7592"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
