class Nocalhost < Formula
  desc "Nocalhost Control CLI(nhctl)"
  homepage "https://nocalhost.dev"
  version "v0.5.1"

  darwin_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.1/nhctl-darwin-amd64"
  linux_x64_url = "https://github.com/nocalhost/nocalhost/releases/download/v0.5.1/nhctl-linux-amd64"

  if OS.mac?
    url darwin_url
    sha256 "98000996ad7f5f82f3ae6bf05895c491abfba78c7a59dcb04b59f66edd8de4ce"
  elsif OS.linux?
    url linux_x64_url
    sha256 "fd1570aff688e070a37a0ff4c95afa4ab4cd1aded30e0a826cc3666bbf78ac45"
  end

  depends_on :arch => :x86_64

  def install
    bin.install stable.url.split("/")[-1] => "nhctl"
  end

  test do
    system "#{bin}/nhctl", "version"
  end
end
