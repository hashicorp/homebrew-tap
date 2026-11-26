# Copyright (c) HashiCorp Services, Inc.
# SPDX-License-Identifier: MPL-2.0

class Tfm < Formula
  desc "CLI tool for Terraform Cloud / Terraform Enterprise migration and administration"
  homepage "https://github.com/hashicorp-services/tfm"
  version "0.17.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp-services/tfm/releases/download/v0.17.0/tfm_darwin_x86_64"
    sha256 "11fbe29dd6846fbfb677dafaf4a0283b65faefa18ba1208ef3c67deaf8a566bb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp-services/tfm/releases/download/v0.17.0/tfm_darwin_arm64"
    sha256 "5d88073e6841308b0d31ee2d86939b7285326580cfc66de19054b54b4b8b93f5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp-services/tfm/releases/download/v0.17.0/tfm_linux_x86_64"
    sha256 "2a06ae6a14abfbeb829dd0d0a442608f90e9c859b577082c23282e9980e728b5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp-services/tfm/releases/download/v0.17.0/tfm_linux_arm64"
    sha256 "650cfe222650ed5ef5eed57229183a39214946333242b7171e94cf01fc27f0dd"
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
