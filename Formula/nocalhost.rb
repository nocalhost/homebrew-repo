class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.2.4"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.4/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.2.4/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "4db3369e0fc6f2abce96707adbf006e048d80f56f8b0945c218695e070972c80"
  elsif OS.linux?
    url linux_x64_url
    sha256 "863115d05b041baf15063c8543d0691ea1d8bee3527b799a6750638ced18c19d"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
