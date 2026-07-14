# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.9.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.5/hc-install_0.9.5_darwin_amd64.zip"
    sha256 "08fd94c229a2ed657badbb9238c74506c525c25b0081254b4dd0639e4bea860e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.9.5/hc-install_0.9.5_darwin_arm64.zip"
    sha256 "211fff76e23a6f02323bfe69c30956e2e44eb75b6cbef47118af5b5f828f502c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.9.5/hc-install_0.9.5_linux_amd64.zip"
    sha256 "da74908a2ddb242436a327956b87d1bb87f9a6081ef6d38354bb0d7ac67a0465"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.5/hc-install_0.9.5_linux_arm.zip"
    sha256 "7ff8561fc12a3eab99b296cb6b203a23e877d514a2753e648f4b28c6fe242756"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.9.5/hc-install_0.9.5_linux_arm64.zip"
    sha256 "8e05d5526e796f2fa945b41570541a40dff4a3af6cd081744e04c728d7d62f52"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
