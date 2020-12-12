class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.0.5"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.6/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.0.6/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "1ab449ac491510e64976c26466a7400f1fcc44cd857e6382539a9b9ba3f95a32"
  elsif OS.linux?
    url linux_x64_url
    sha256 "09f4156352f74e43b65e141380eb36e01205b5c0718fdc0d4bdf8322798fea51"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
