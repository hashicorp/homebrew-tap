# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class AthenaCli < Formula
  desc "Athena CLI"
  homepage "https://github.com/hashicorp/athena-cli"
  version "0.1.1"

  if OS.mac?
    url "https://releases.hashicorp.com/athena-cli/0.1.1/athena-cli_0.1.1_darwin_amd64.zip"
    sha256 "4683d65e3116df6191dbb896f400fa6b21bacfb198109f1b16b7c488b54a3075"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/athena-cli/0.1.1/athena-cli_0.1.1_linux_amd64.zip"
    sha256 "5eded72bab516b8b5ea376e13583d0a0add40b6b0c0e0e522c3821b1acae53f8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/athena-cli/0.1.1/athena-cli_0.1.1_linux_arm64.zip"
    sha256 "897eb860ad9fd90376cd0225ab431dcd27886a242f3481af65919a666c55350a"
  end

  conflicts_with "athena-cli"

  def install
    bin.install "athena-cli"
  end

  test do
    system "#{bin}/athena-cli --version"
  end
end
