# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.5.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.5.2/tfstacks_0.5.2_darwin_amd64.zip"
    sha256 "aa5011dbf3720173f1a8108ddbcf5f079e39e89baa9fec2758d9f8926ffcf3e5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/0.5.2/tfstacks_0.5.2_darwin_arm64.zip"
    sha256 "05a2c881e0443fc57c7377fa7e04112586aeaac86160e87ce5d455612a4b4346"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.5.2/tfstacks_0.5.2_linux_amd64.zip"
    sha256 "2e65201116a0bb56e8378370e1d2c59e9054ef5bb14495f3b656788fe930acdf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.5.2/tfstacks_0.5.2_linux_arm.zip"
    sha256 "0df0ce9fe68228a5eed23eb1f32f778af0e6e4b1163624f5b677abd421de6c90"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.5.2/tfstacks_0.5.2_linux_arm64.zip"
    sha256 "80b276954c5af688c65fb7a8949b213410a990d7291a38e0b38b169e795f3c9f"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
