# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.34.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.34.2/terraform-ls_0.34.2_darwin_amd64.zip"
    sha256 "41301b83ec1eb4a9d490c83e287cf1a5fa06d2f80495ab2e62cebe1716e67660"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.34.2/terraform-ls_0.34.2_darwin_arm64.zip"
    sha256 "7bea6396d109d0adf3bd7dd3e948038e410d6001f5a4d21b08d1c7a4aea5376c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.34.2/terraform-ls_0.34.2_linux_amd64.zip"
    sha256 "fac22af6814b3b4a0a628ead4a1026274554d5ed7094497e474dec45e652819d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.34.2/terraform-ls_0.34.2_linux_arm.zip"
    sha256 "8422b308699178cb4d5b2b6a492f180fd5669ac66a690ad6f8e490befac8bf3c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.34.2/terraform-ls_0.34.2_linux_arm64.zip"
    sha256 "8aaa22fecba9205d4b83bb54afa58ec0c76348a098b60b072b965eb1df19661e"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
