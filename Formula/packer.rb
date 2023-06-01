# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.1/packer_1.9.1_darwin_amd64.zip"
    sha256 "8de8c869e002a1380481a3dd14de343b251ae636a8ffc0398103784c25897c43"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.9.1/packer_1.9.1_darwin_arm64.zip"
    sha256 "57f0836c7e82e0686a8e514c9fd44c492aa81cd3b811b348c9d2a4bc5ba16251"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.1/packer_1.9.1_linux_amd64.zip"
    sha256 "793ed62255b9e572eda0c77d2a770f5fde501314b7598320786f1e51feb260d6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.1/packer_1.9.1_linux_arm.zip"
    sha256 "637377f9d302c215519dd9709e0497e5fff1e599415bd21c9f40db15dd8f9eee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.1/packer_1.9.1_linux_arm64.zip"
    sha256 "ed1ac407ec3ce421beb221f8869cdc0998fbefb96cb9b89e71e47f9a1421fdee"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
