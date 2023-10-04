# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.32.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.0/terraform-ls_0.32.0_darwin_amd64.zip"
    sha256 "328a1758c836f2b0c38e1bd68dcf3bed92573c3a83fb9974e5306cd203e7fbf5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.32.0/terraform-ls_0.32.0_darwin_arm64.zip"
    sha256 "a1380d65f6b446e5e36b9f244c33428131cca83e525b7f6548dd7abb1ce9c008"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.0/terraform-ls_0.32.0_linux_amd64.zip"
    sha256 "42555a8ade0fba17aef906aa41007574544b8b579ec9a13345801bc68f418e86"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.0/terraform-ls_0.32.0_linux_arm.zip"
    sha256 "fe7217dd86993740386d4b99a5af7724d3746e8c3ff7df3c2bb9672049710675"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.0/terraform-ls_0.32.0_linux_arm64.zip"
    sha256 "aa75387501701306780ded0c74efbc2150fd78791f10debd37f0b4d158c2a376"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
