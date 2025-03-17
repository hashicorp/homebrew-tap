# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.40.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.40.0/consul-template_0.40.0_darwin_amd64.zip"
    sha256 "c1404b8a6fb4de51679a41ccaae309760e28c8816eddaae545afda4a29eccf14"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.40.0/consul-template_0.40.0_darwin_arm64.zip"
    sha256 "f2ce33c6deb5cfd071afd3cd92ac619558f176a5448f37e3c2826b9a74022d96"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.40.0/consul-template_0.40.0_linux_amd64.zip"
    sha256 "f73cb36988b9aaccb0ac918df26c854ccd199e60c0df011357405672f3d934bc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.40.0/consul-template_0.40.0_linux_arm.zip"
    sha256 "98160419915167fe83825165d0f69c5859ab8a1e34762b5ff37553328b3c5c7f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.40.0/consul-template_0.40.0_linux_arm64.zip"
    sha256 "8bd7a06d56ade62deb17f7a3618358e97896be6c162951b3c535a228e074c7a4"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
