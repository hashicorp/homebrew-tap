# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "2.0.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.3/consul-dataplane_2.0.3_darwin_amd64.zip"
    sha256 "360b56c20918b43c4200645c706f015efadf8d848a62664682972865710676a6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.3/consul-dataplane_2.0.3_darwin_arm64.zip"
    sha256 "941c89faf891828797d8ad20bf7070b54e0504122346973b94395572a431ff2f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.3/consul-dataplane_2.0.3_linux_amd64.zip"
    sha256 "04936fca39dc9b3b2b2f46ac847f1c2562842ebd198e3b01aa7ee54a6a1e3997"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.3/consul-dataplane_2.0.3_linux_arm.zip"
    sha256 "33b1fa72b79476e6843cff3a0fbf81dcce971e9534af4b9944c2f532ee859fdd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.3/consul-dataplane_2.0.3_linux_arm64.zip"
    sha256 "c81f7c008628023f65a191e55321b100ade689e80df70a0d438c9cd673f45901"
  end
  
  depends_on "envoy" => :recommended

  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end
