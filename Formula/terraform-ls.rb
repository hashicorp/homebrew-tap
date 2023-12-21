# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.32.4"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/terraform-ls/0.32.4/terraform-ls_0.32.4_darwin_amd64.zip"
    sha256 "b8c52581d0518b07e03bcafd77953ec9535401d984d8b973795717dd0cd37bd1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/terraform-ls/0.32.4/terraform-ls_0.32.4_darwin_arm64.zip"
    sha256 "68ebaf2d62562592ffb724291060dc117eb1fac5f9ba5f3bbe3931f870df5c94"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/terraform-ls/0.32.4/terraform-ls_0.32.4_linux_amd64.zip"
    sha256 "fd80ca7716c1ed2ef053d5e72382c5d06797fc48bf18e19d10b6550b83947f84"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/terraform-ls/0.32.4/terraform-ls_0.32.4_linux_arm.zip"
    sha256 "722bbd76bab37dec15365154500ef46cae59b6d6b9d88348947ebf96def43d03"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/terraform-ls/0.32.4/terraform-ls_0.32.4_linux_arm64.zip"
    sha256 "840239d16d4c304e67e91581963aa4888c81bd8658b36b538d905a4922172971"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
