# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.5/terraform-ls_0.38.5_darwin_amd64.zip"
    sha256 "713d59e6a1eda9166d7010e3b550c42090b38b4801b700c86b79db9e56cac825"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.38.5/terraform-ls_0.38.5_darwin_arm64.zip"
    sha256 "130a43f679e159a7675c7c77f350b3cede0ee62a95f9d7faef9a451f8671aedf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.5/terraform-ls_0.38.5_linux_amd64.zip"
    sha256 "94e85b54353fd036e82c039dc7f8d256dc0fd507e667d9b33574a4ab22c06b1a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.5/terraform-ls_0.38.5_linux_arm.zip"
    sha256 "0c745503cca174b90b8bc453297fa1e750f34ef52c55df227c60ce291bca4683"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.5/terraform-ls_0.38.5_linux_arm64.zip"
    sha256 "88438c0f339e3be72b2a08131d1a89b79291c94cd1377aeea643785dac7010c0"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
