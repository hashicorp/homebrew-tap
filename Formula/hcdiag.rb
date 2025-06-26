# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.8/hcdiag_0.5.8_darwin_amd64.zip"
    sha256 "21ae17f6cb55d65ba3ba1dc96f990e86f17a1fa976dba4e1220c66eaea12e2a9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.8/hcdiag_0.5.8_darwin_arm64.zip"
    sha256 "48d52fd6eb86cf07fe68defec8fe44b60e2f49a17dc4154cd702e1113805b267"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.8/hcdiag_0.5.8_linux_amd64.zip"
    sha256 "624d846c82895ae6912576be6f1dbb3e0408175d7f12b03303dbfbc076b54552"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.8/hcdiag_0.5.8_linux_arm.zip"
    sha256 "ec792be016eacc64ed080a024af9a0c7b8b962a2c27c1aa01f15bc078fa956ea"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.8/hcdiag_0.5.8_linux_arm64.zip"
    sha256 "e3326d6d3e6260bdd6c8fdb4db180c5599f81799a9c419c207091684caf4113d"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
