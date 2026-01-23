# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
  desc "Terraform Migrate"
  homepage "https://www.terraform.io"
  version "2.0.0-beta1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta1/tf-migrate_2.0.0-beta1_darwin_amd64.zip"
    sha256 "e0e8faa8d7682274ec0250d8143db5bd3e6b612da16e495f13b1155529ab89af"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta1/tf-migrate_2.0.0-beta1_darwin_arm64.zip"
    sha256 "2a8148c72c0832bbdd84973d398eb2b480271bc59fe0647a5fc2c3bd1ea46c62"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta1/tf-migrate_2.0.0-beta1_linux_amd64.zip"
    sha256 "20d132a512820561aeb45fe81044c4da1a917229ec5c08dc2f295f598c34fb17"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta1/tf-migrate_2.0.0-beta1_linux_arm.zip"
    sha256 "b2a4bc22bce7d1899f39ec961f67c4a098fb0ad30df126d8d2f55db0a2e328c5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta1/tf-migrate_2.0.0-beta1_linux_arm64.zip"
    sha256 "26fa40f64ff9ef02777f2050f3e2d05c4f962cdb561e6ae9d4e21a655f931350"
  end

  conflicts_with "tf-migrate"

  def install
    bin.install "tf-migrate"
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
