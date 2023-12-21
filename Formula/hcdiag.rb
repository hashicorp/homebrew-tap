# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.2"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/hcdiag/0.5.2/hcdiag_0.5.2_darwin_amd64.zip"
    sha256 "3b3cc79035a0331089e1d9c99787df6c48bb95ba6822b9ff023db4635e356428"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/hcdiag/0.5.2/hcdiag_0.5.2_darwin_arm64.zip"
    sha256 "287a13a2e9573d04866b9655d5b49ad3963e59b3790ba0e2f83060b3e9913d91"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/hcdiag/0.5.2/hcdiag_0.5.2_linux_amd64.zip"
    sha256 "78efaf950f52193996af67fa15057328b282271a25cc50249b3e201a50c92270"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/hcdiag/0.5.2/hcdiag_0.5.2_linux_arm.zip"
    sha256 "5acff8756600a7fce235dd202f4a5bc7d196d90c4076fb67cf173a8a4e6523cf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/hcdiag/0.5.2/hcdiag_0.5.2_linux_arm64.zip"
    sha256 "d8272c2b6788d75141d867a77ec4a15822ddfec507c6ff8984eccfc584c88f95"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
