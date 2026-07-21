# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class TerraformPolicy < Formula
  desc "Terraform Policy"
  homepage "https://developer.hashicorp.com/terraform/policy/reference/cli"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfpolicy/0.1.0/tfpolicy_0.1.0_darwin_amd64.zip"
    sha256 "bd317b6c0df941e5385a59482bd9b9ab1fd50382431a1070cfacb35833958c0b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfpolicy/0.1.0/tfpolicy_0.1.0_darwin_arm64.zip"
    sha256 "df6294bbc538ef7eff51819be2671295d721c8de4841ad5b7d4907f58d250394"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfpolicy/0.1.0/tfpolicy_0.1.0_linux_amd64.zip"
    sha256 "568c02d03aa8c066935eefd4d3d86a7afbbd040aa2ac47711e4eb37a6a281259"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfpolicy/0.1.0/tfpolicy_0.1.0_linux_arm.zip"
    sha256 "ba4e3857257901aff50737b9769ee0fa06c2868677869818d45da5e3cf690f8b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfpolicy/0.1.0/tfpolicy_0.1.0_linux_arm64.zip"
    sha256 "e31d4a69a973e01049f007e7362c7b59c091468df5584050329ee4ae49154c00"
  end

  conflicts_with "tfpolicy"

  def install
    bin.install "tfpolicy"
  end

  test do
    system "#{bin}/tfpolicy --version"
  end
end
