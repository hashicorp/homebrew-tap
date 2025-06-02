# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.13.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.13.0/packer_1.13.0_darwin_amd64.zip"
    sha256 "09d5979b8e9b963f9e660e2457e69a8c79525cd0cbde69f8817039c842356c3e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.13.0/packer_1.13.0_darwin_arm64.zip"
    sha256 "c53bc7e835ab2e75bb60524555e3deb976fcef4e791f8613048ea225691175af"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.13.0/packer_1.13.0_linux_amd64.zip"
    sha256 "51d5920da4f35f9de67043e3861ae61cbdf019dd87011f2c16fa6146b7e78970"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.13.0/packer_1.13.0_linux_arm.zip"
    sha256 "c36d3ad631e9aea0fd9be55b84ac36749daba494cfe3d4d97d7134f60efabb97"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.13.0/packer_1.13.0_linux_arm64.zip"
    sha256 "dbb7b764e8ac15376e9330d40a0a23a97baa5435a1698883551a1599cebf1976"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
