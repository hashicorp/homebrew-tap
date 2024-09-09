# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.5.0/hcp_0.5.0_darwin_amd64.zip"
    sha256 "fc0ecf308eb8920d8e5578cceb4d1e846c088278be5f6a51f73bacbda406cef1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.5.0/hcp_0.5.0_darwin_arm64.zip"
    sha256 "ea34bc45fb7ec1e0b20ad5e5dcd48ef75c942388e6bbde227a9b9a2ef5550863"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.5.0/hcp_0.5.0_linux_amd64.zip"
    sha256 "c6f7692b067b6ea6245311adc175565c7b451191564df590ca426f8d540178ac"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.5.0/hcp_0.5.0_linux_arm.zip"
    sha256 "061865e49220a35ceadf4b6b21f2926f172d8e1f2a6e0d666eb079e46e040c88"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.5.0/hcp_0.5.0_linux_arm64.zip"
    sha256 "7b57e9dae0c6f2706f3cb3d152e6fd1c777896e07196bfcbb5db7a618d45f313"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
