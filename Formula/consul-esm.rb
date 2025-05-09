# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.9.0/consul-esm_0.9.0_darwin_amd64.zip"
    sha256 "1e9c900815a49377ed64694ff660f173dc2e6d93ae5cf46918e8868a32211474"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.9.0/consul-esm_0.9.0_darwin_arm64.zip"
    sha256 "9fb254cc9619727ab938dd544937aea73742549acfdf99c4f009e5235f03643c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.9.0/consul-esm_0.9.0_linux_amd64.zip"
    sha256 "9ed3a3381d451fef8ed2067dec9887962ebb92702650d43a8c85ca3c706372ea"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.9.0/consul-esm_0.9.0_linux_arm.zip"
    sha256 "ebcacde47a3c995bb9b9476b616371e2d988a1a86333253ec5ea1aab3d6c6998"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.9.0/consul-esm_0.9.0_linux_arm64.zip"
    sha256 "a2bedaaba5279530cd2322590716b95948ae9296a023d216053b8bd88f3d0bfe"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
