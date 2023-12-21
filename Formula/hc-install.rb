# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.6.2"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/hc-install/0.6.2/hc-install_0.6.2_darwin_amd64.zip"
    sha256 "6481aa34c3979a3e39e0dd0ef7fbd99fd302fd279839ac9530a9edd50e0b49c0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/hc-install/0.6.2/hc-install_0.6.2_darwin_arm64.zip"
    sha256 "af19daf8896ad4258ad39c513ff8b414578765506db71efdfdad9699f46fc0d2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/hc-install/0.6.2/hc-install_0.6.2_linux_amd64.zip"
    sha256 "c7f084d1f4829084476c0c54006982682691d89408ff4659f03e05cdfa5a2baf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/hc-install/0.6.2/hc-install_0.6.2_linux_arm.zip"
    sha256 "4c15a66b0f798879bfe4e91ad287438fa92c66e13dc46669c8fd105888c6d799"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/hc-install/0.6.2/hc-install_0.6.2_linux_arm64.zip"
    sha256 "49895b4ca7edafcc4f557e577a34c5d0cde86d6dec5cb877ac4fe72e276936ad"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
