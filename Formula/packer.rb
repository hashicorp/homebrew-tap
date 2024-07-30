# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.11.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.11.2/packer_1.11.2_darwin_amd64.zip"
    sha256 "107c4334b136ffb5b884bac87f2ef6620f15df7d1d0a646db20b8054f9c607fe"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.11.2/packer_1.11.2_darwin_arm64.zip"
    sha256 "b89f4944cca27839922a397248b94fc20d92acf15933bb36d58eb6d1283dc254"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.11.2/packer_1.11.2_linux_amd64.zip"
    sha256 "ced13efc257d0255932d14b8ae8f38863265133739a007c430cae106afcfc45a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.11.2/packer_1.11.2_linux_arm.zip"
    sha256 "2f6e1928204b61f171b9d79cbc697a5b35c65cd435e1a38bb648bb7e96dba284"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.11.2/packer_1.11.2_linux_arm64.zip"
    sha256 "dd296d743dd4593304307583cff5290bba9b868fc2b0b605b64566f8141ca728"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
