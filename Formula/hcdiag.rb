# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.3/hcdiag_0.5.3_darwin_amd64.zip"
    sha256 "2e0ba85d2425881c0a0481689bab09438d0fa05c14d5982975a2a443129414d5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.3/hcdiag_0.5.3_darwin_arm64.zip"
    sha256 "c22634ac3236fa5beb99ef83bc802369d78c281f7403bdc351ad4ad0aadaa445"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.3/hcdiag_0.5.3_linux_amd64.zip"
    sha256 "e8b7e1cf7cd3216f0179a0d5fb44cb0d6b5425b7fd023849d2078f0f27d7cb63"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.3/hcdiag_0.5.3_linux_arm.zip"
    sha256 "233b94d5d0426eac582b91838eec70a9ccdd5333be1d214a177acffe5d9fb210"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.3/hcdiag_0.5.3_linux_arm64.zip"
    sha256 "0f6c53142fbc9d6d4748f16571df8e6903a4dc1373c20c9256f8c3424e0cdc54"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
