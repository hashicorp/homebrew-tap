# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.42.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.42.0/consul-template_0.42.0_darwin_amd64.zip"
    sha256 "a525917c6323e90e3275c66c471a8d0cc75e7314cc02a0996a36d03202536bbc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.42.0/consul-template_0.42.0_darwin_arm64.zip"
    sha256 "d8b70b577ec882117d3952b519430e1f968e9c43dbc78ddfe0f0d57ce9dbe3ec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.42.0/consul-template_0.42.0_linux_amd64.zip"
    sha256 "94d5044b822c5219bb116916b8d4d2545630e6ce0e1639ddd25309a26cf62ff2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.42.0/consul-template_0.42.0_linux_arm.zip"
    sha256 "3f9e77b147af53fb316865bcb077c344689ef2646400d383e68125342cdcd5be"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.42.0/consul-template_0.42.0_linux_arm64.zip"
    sha256 "c952d68d72383f7559980ba2d9bf1884d05822fe0d16b76c47ac0372b303204a"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
