class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.4.0-rc1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.0-rc1/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.4.0-rc1/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "751b6fb4a04e5ffbdeb6eb561e2787cf9c036983e220e78c01b257894745c86b"
  elsif OS.linux?
    url linux_x64_url
    sha256 "431da2938679c47248bb5ce11755dfcbda6759353dca3f2ac9ec38e75aa2ef5f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
