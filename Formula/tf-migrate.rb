# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
  desc "Terraform Migrate"
  homepage "https://www.terraform.io"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/1.0.0/tf-migrate_1.0.0_darwin_amd64.zip"
    sha256 "dfb8e607548e8c73b256ee0a12a8046d328cfefa9e0c13f2498d44dfd029a7d6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tf-migrate/1.0.0/tf-migrate_1.0.0_darwin_arm64.zip"
    sha256 "e0472880b66ff73b16b7b87b3744c81f77efbfb6e5e0b2f6ac4ed5c0dc353f29"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/1.0.0/tf-migrate_1.0.0_linux_amd64.zip"
    sha256 "6b47a3e3dbe631f5647911d61625c814d3fc4aee8e1bed806e4c4986b186eb86"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/1.0.0/tf-migrate_1.0.0_linux_arm.zip"
    sha256 "0ba10478bf9054fb00d5e2dabf967a554d9046ad424e3504de589304ad96910c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/1.0.0/tf-migrate_1.0.0_linux_arm64.zip"
    sha256 "df6bf178bd7035df6f194b08cc7c609c47c7f1c9b2e77add34ee8e12203a178d"
  end

  conflicts_with "tf-migrate"

  def install
    bin.install "tf-migrate"
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
