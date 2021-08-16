class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.0"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.0/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.0/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "f9534c30caf6ed155fac7fa86ebeb61ed5b119edfc81b1135baba803b2cbc8ef"
  elsif OS.linux?
    url linux_x64_url
    sha256 "c71e894a785ba311ea0a1e6650209fbd4163cdd33d5f6ad4c3be907ee93ac7c2"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
