class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.6.33"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.33/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.6.33/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "f991177dd349c032064028103e48179da8af85f7a59a971d7d2615ef7ad8be22"
  elsif OS.linux?
    url linux_x64_url
    sha256 "ae6f6dbed13a55870f54178544bebc3b7b78e7b11bd126d8bd629243df3f85e8"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
