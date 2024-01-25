# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.2.0/tfstacks_0.2.0_darwin_amd64.zip"
    sha256 "28b49a1810a3e18586f1236f35f394b27023602eb033ef4444c8c943e13ae529"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/0.2.0/tfstacks_0.2.0_darwin_arm64.zip"
    sha256 "8d0f51b927bcde38d129e1a3251ec70a2b0694350a811c54495c94d116767ab8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.2.0/tfstacks_0.2.0_linux_amd64.zip"
    sha256 "3d20db2cace993f03ea6f09a488d5430f44fc37b7dd37a27ad461d5a175ad64e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.2.0/tfstacks_0.2.0_linux_arm.zip"
    sha256 "d2655d08bd89caa758ca5e82e94dbdb29f788542f65d6b9627e23c7bd961b79d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.2.0/tfstacks_0.2.0_linux_arm64.zip"
    sha256 "e7660c709b13c608156eb4d25f99b1fac4a047baba55e990c39d5ecfec43d5cc"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
