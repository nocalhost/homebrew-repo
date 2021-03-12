class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.3.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.1/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.3.1/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "ba12a55af518058f9b974d76ffcf72d0d5f50afae32391c8c7ee8acf4311302b"
  elsif OS.linux?
    url linux_x64_url
    sha256 "c36d267015c1c1d153e24228acf09fef8096e7ef7f98bdcf56a60ce396b4c1e3"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
