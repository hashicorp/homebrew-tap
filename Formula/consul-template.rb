class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.29.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.5/consul-template_0.29.5_darwin_amd64.zip"
    sha256 "197df970ed04f20e8f96eb1d9eb0257552e6bb8b81d819286e01686deb207c68"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.29.5/consul-template_0.29.5_darwin_arm64.zip"
    sha256 "adbc0821f72c687de2c1b747fd3df977395f7c7a24b69bfabd7833486f69f80e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.5/consul-template_0.29.5_linux_amd64.zip"
    sha256 "24aa8c67a2ac95c03524d62dd0e1815359e8c9689324b48e9c75ed2b6e25a5c8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.5/consul-template_0.29.5_linux_arm.zip"
    sha256 "7e4abfaf37f1ac6eda00e49f3600c013a1e6c7311521ad41d1abb65911d1645f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.5/consul-template_0.29.5_linux_arm64.zip"
    sha256 "37ac8bb2b796e5d975c625df4e85464244b4632a98151fd495c527ad69da04a3"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
