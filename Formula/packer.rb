# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.9.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.5/packer_1.9.5_darwin_amd64.zip"
    sha256 "61464390bf9f3e14bac52bc9b1172f24783d9a19855958e805c596359687518e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.9.5/packer_1.9.5_darwin_arm64.zip"
    sha256 "33a23c1ef6c42a0d80ef44595ddfa8963027c993a2279f72320d0d5c86312ac8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.5/packer_1.9.5_linux_amd64.zip"
    sha256 "6f8272658a6d606583c2b3deaad272233db6e84a6ee651bf17a0d46d8cea4a9c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.5/packer_1.9.5_linux_arm.zip"
    sha256 "2d90f0f5b65486690cbc9458518b022a749b5116e009b7cd8801ac641bb96ef7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.5/packer_1.9.5_linux_arm64.zip"
    sha256 "5584a6fe1c86f140e57c086d8dcbd1785a5eae467062777f6a325fbfdd3b82d9"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
