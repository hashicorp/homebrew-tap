# Copyright (c) HashiCorp Services, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfm < Formula
  desc "CLI tool for Terraform Cloud / Terraform Enterprise migration and administration"
  homepage "https://github.com/hashicorp-services/tfm"
  version "0.17.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp-services/tfm/releases/download/v0.17.0/tfm_darwin_x86_64"
    sha256 "b2749aa2a1be2790c3c2f5dea9419c5511a8c38f9c29cda94e8a5f1d88efc856"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp-services/tfm/releases/download/v0.17.0/tfm_darwin_arm64"
    sha256 "e3cc2b369b95a38c2de2ee173ee9596e2524803bb768bff7b6d5210e61671090"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp-services/tfm/releases/download/v0.17.0/tfm_linux_x86_64"
    sha256 "b66c3ab55ee1dd5db12bae00a8423b3767e49923ee1092548510e233af2404cf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp-services/tfm/releases/download/v0.17.0/tfm_linux_arm64"
    sha256 "3b0f4978d2f182212a05d17b535afb34d2326247c4842c04addfc6983222da08"
  end

  def install
    # Release assets are raw binaries (not archives); the downloaded file name
    # matches the asset name from the release.  Rename it to the canonical
    # binary name during install.
    os_arch = if OS.mac? && Hardware::CPU.arm?
      "darwin_arm64"
    elsif OS.mac?
      "darwin_x86_64"
    elsif Hardware::CPU.arm?
      "linux_arm64"
    else
      "linux_x86_64"
    end
    bin.install "tfm_#{os_arch}" => "tfm"
  end

  test do
    assert_match "tfm version #{version}", shell_output("#{bin}/tfm --version")
  end
end
