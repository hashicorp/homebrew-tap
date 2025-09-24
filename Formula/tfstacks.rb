# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.1.0/tfstacks_1.1.0_darwin_amd64.zip"
    sha256 "3b1c130b46325d5fc736e853afa5f3b8d9b0bca37002b2598ca3d774c42b9029"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/1.1.0/tfstacks_1.1.0_darwin_arm64.zip"
    sha256 "29ebaaea33ecfd33698b39badd9b491e2118567a755528ac0e3b55ffa022d839"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.1.0/tfstacks_1.1.0_linux_amd64.zip"
    sha256 "cb379e1c2cc5f4f750f8385f3b5d188ef5eeb8eed988e055aa47770d35b5293b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.1.0/tfstacks_1.1.0_linux_arm.zip"
    sha256 "5e1a078985688b4cee3969ee8c05fc8dfab489237c4a72f29433fc028f3af2a3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.1.0/tfstacks_1.1.0_linux_arm64.zip"
    sha256 "edf0560b744b46dca78b360cd1672a4147fc36fc6edc40ad81e6fd0823e23ae3"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
