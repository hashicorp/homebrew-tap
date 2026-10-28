# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.15"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.15/hcdiag_0.5.15_darwin_amd64.zip"
    sha256 "08b28ccabff23637f5595e2e771f09fe0ea7f69100f52d5aa67a15184f935051"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.15/hcdiag_0.5.15_darwin_arm64.zip"
    sha256 "64bf39f2091692da6e6cb593254fb32bb44c933a3a80ac43165d7a84a987e0f1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.15/hcdiag_0.5.15_linux_amd64.zip"
    sha256 "f9f05208f03039228a69b4838e4752bc6c46c176d20828227cb37651f77b58da"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.15/hcdiag_0.5.15_linux_arm.zip"
    sha256 "1084e22e00959bf861997a15c7f27e4403fb3b1c4d1214306357a2734349bfd9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.15/hcdiag_0.5.15_linux_arm64.zip"
    sha256 "edeb3fae2f487858933fb2155880f7883ee602c74fc8d58a073877b513146c10"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
