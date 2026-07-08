# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.42.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.42.1/consul-template_0.42.1_darwin_amd64.zip"
    sha256 "e8d76a5161576c6235f0a60f712bc738f7428a5ebb308abf82d25dce847bac83"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.42.1/consul-template_0.42.1_darwin_arm64.zip"
    sha256 "0b6831351f3a57d498dd76aaae01fd085490c0d1b114f9e687dc7e470ec4e782"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.42.1/consul-template_0.42.1_linux_amd64.zip"
    sha256 "ab86817a4acf619c6612d99b8e11496a81027f2b84632887c941c3e7d43cbaa7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.42.1/consul-template_0.42.1_linux_arm.zip"
    sha256 "63ed2c349072f0d5cdee168650d849ab073c0df647baf4778a25d6ce25a0eba6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.42.1/consul-template_0.42.1_linux_arm64.zip"
    sha256 "125afde2fef95fef6e65eb596120e9b45edc9f76f78d001438974f1121abdfaa"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
