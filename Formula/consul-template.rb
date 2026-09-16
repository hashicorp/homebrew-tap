# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.43.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.43.0/consul-template_0.43.0_darwin_amd64.zip"
    sha256 "a7cacd136ddc36d1453a1efc84992526ca9d65d909270478ee7175f96e876be0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.43.0/consul-template_0.43.0_darwin_arm64.zip"
    sha256 "c35c89e84d3b6ecf99a13c61267ecc259077ea24f8d498861695e8c4b4048c16"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.43.0/consul-template_0.43.0_linux_amd64.zip"
    sha256 "aa49f009a708f3e3beea990aa29cfaecfe6925c0b17ca9201747e1469922264e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.43.0/consul-template_0.43.0_linux_arm.zip"
    sha256 "37bfba774c059116553dd38f1daa0bc521747a9a00ca42e0cc279afed2304f67"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.43.0/consul-template_0.43.0_linux_arm64.zip"
    sha256 "c6d7fc056c54ea53dd5b543cda9958b5c7ba51208e62f9d5973ffcddd3d3be67"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
