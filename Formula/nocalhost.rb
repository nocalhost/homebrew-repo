class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.26"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.26/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.26/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "df38e0378ba66a8e8bd9d9bdfc887bb79c120e6c0af5ca659f253f55434594d1"
  elsif OS.linux?
    url linux_x64_url
    sha256 "51c30e444240b0ea968692c254c01fb55fed6d500eb3cc1f93bd87702abb1a45"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
