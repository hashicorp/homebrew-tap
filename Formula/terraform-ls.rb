# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.33.2"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/terraform-ls/0.33.2/terraform-ls_0.33.2_darwin_amd64.zip"
    sha256 "8de51bdc4cca248c100addaefd5b379566fecd1d991d18c42237c8b7bd69feed"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/terraform-ls/0.33.2/terraform-ls_0.33.2_darwin_arm64.zip"
    sha256 "a0174e9eb863bc6bd688b52a7de43faf72cc8addc5b304b356d2132fe2b07b76"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/terraform-ls/0.33.2/terraform-ls_0.33.2_linux_amd64.zip"
    sha256 "941a8de352951011dfbc816f7d48f68fb3908726147cf95389d0601223cbd832"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/terraform-ls/0.33.2/terraform-ls_0.33.2_linux_arm.zip"
    sha256 "0f47f0cbc81ca4952091a9786c8d2e37150f28499370e0362dc4db0ed6c85e94"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/terraform-ls/0.33.2/terraform-ls_0.33.2_linux_arm64.zip"
    sha256 "fb2ad60402062b2c8f639a35138b4f629896394a233c8924c04425e182980cd7"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
