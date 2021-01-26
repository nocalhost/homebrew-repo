class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.7"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.7/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.7/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "b7af696174dd863de51d2fecf4af5e617e8bae0a8f0417a066a6020a862c7455"
  elsif OS.linux?
    url linux_x64_url
    sha256 "b30f3e392646a8b28438d00a6be6bfd97465c18aba497d370d425fb2f79bd383"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
