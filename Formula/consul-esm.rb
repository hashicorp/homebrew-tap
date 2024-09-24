# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.8.0/consul-esm_0.8.0_darwin_amd64.zip"
    sha256 "354b9132f2f411aad43334f84c4e824efd1b1699f6adecf31096ad1aec9c0792"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.8.0/consul-esm_0.8.0_darwin_arm64.zip"
    sha256 "5d1b264ddb82df8d72bd48693e5d4bb96ac2490e2e60767956c8f304e806eebf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.8.0/consul-esm_0.8.0_linux_amd64.zip"
    sha256 "8ad873fdee0b38b5b51830b5218b04d3fe60ee47dc1d6993ce431d5ed91f223c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.8.0/consul-esm_0.8.0_linux_arm.zip"
    sha256 "318cd3dcdce44c5ef88f1dafe3b82a77fbfc9f3fb8aedf03fe1c5fdd4701298a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.8.0/consul-esm_0.8.0_linux_arm64.zip"
    sha256 "87b22ab61e9a45651fbf54a2f60c5d95e768cee013bc23d091ba354292cd8ad7"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
