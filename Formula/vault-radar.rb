# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.10.0/vault-radar_0.10.0_darwin_amd64.zip"
    sha256 "5b1fe7dfd0cd76597ae630f28908cdb74228bd31f5662780ae3337a8a0b5661e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.10.0/vault-radar_0.10.0_darwin_arm64.zip"
    sha256 "3d78c15eacd599c57e1be1bb73e832df81835249970987d4f1b57ebd9b028698"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.10.0/vault-radar_0.10.0_linux_amd64.zip"
    sha256 "262642aac1a814de1d0422d0e539da13a42ff0209c2ac582b1cc3733e400b82c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.10.0/vault-radar_0.10.0_linux_arm64.zip"
    sha256 "462747b8376814f98dff2bc89dc87553d4bd014e6663da7add882e75af2b2026"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
