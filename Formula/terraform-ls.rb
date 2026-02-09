# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.4/terraform-ls_0.38.4_darwin_amd64.zip"
    sha256 "2ba8d3b2557fa0f2f175bbfd60103530ba4b3b2aea1d93bc1d993d2f48922f5f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.38.4/terraform-ls_0.38.4_darwin_arm64.zip"
    sha256 "b056438733ef2176f2fbb5e582a58de9cab9c8961123467bf4cb18d072705b37"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.4/terraform-ls_0.38.4_linux_amd64.zip"
    sha256 "bdc9743dc3efd248bbe4b46db7d2ffd74945cca0e19909761f6b2687b5e7bb59"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.4/terraform-ls_0.38.4_linux_arm.zip"
    sha256 "70e09cf4c0a9e8b5b4503d53734e78f06d1c13b4c1029eff39bf1095d53046f5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.4/terraform-ls_0.38.4_linux_arm64.zip"
    sha256 "7ca4ce7be721d6bab0273b13378c25c5d1fb2d79131c255dbfe948dcdd87cb11"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
