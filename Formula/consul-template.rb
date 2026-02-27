# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.41.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.41.4/consul-template_0.41.4_darwin_amd64.zip"
    sha256 "3d9be40e07c084a83d3a26fa7ddeef6873d407ee4764efd3c8f56e9bc7aaeea9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.41.4/consul-template_0.41.4_darwin_arm64.zip"
    sha256 "ac05327e710dd1512f44321f268362385ebf71261c0eff74a7a84762bc59dc10"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.41.4/consul-template_0.41.4_linux_amd64.zip"
    sha256 "9e999cfbfdc47e67d3d91e6e4edbecaa3d7c3b026307b18c0485b64d15e5083a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.41.4/consul-template_0.41.4_linux_arm.zip"
    sha256 "e144cfe4301d2cdaa1efcad86e40aac58c67e9ba158cd07a728ec0fa2b1d6ce0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.41.4/consul-template_0.41.4_linux_arm64.zip"
    sha256 "c6fb0f8beddf897ec4d78073ea1ff7a1336f2b9bb23d68d191a04e8c3669dd25"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
