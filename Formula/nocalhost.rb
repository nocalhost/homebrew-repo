class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.34"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.34/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.34/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "74276d14f927161b02ad93c005c55732c00824456835df7ec86409d432b223cc"
  elsif OS.linux?
    url linux_x64_url
    sha256 "a3b2264a636fa4a2e294a75e6eb054b46eaac31f5bc7e22a873cfb11ecf31dda"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
