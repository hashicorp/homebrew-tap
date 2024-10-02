# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
  desc "Terraform Migrate"
  homepage "https://www.terraform.io"
  version "0.0.2-beta"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-beta/tf-migrate_0.0.2-beta_darwin_amd64.zip"
    sha256 "aeabad5b87f3875efd531667ca6fcd41b8106144af742b3156ddb2db6f803cd6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-beta/tf-migrate_0.0.2-beta_darwin_arm64.zip"
    sha256 "c8f955a2942646ac0045838085e11dc5a12c0389a9219eb690648c66da798025"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-beta/tf-migrate_0.0.2-beta_linux_amd64.zip"
    sha256 "7ef7ade45bf5a923ee9f69fe2d47cbffe5d4c39abe129208c6600a10755ec262"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-beta/tf-migrate_0.0.2-beta_linux_arm.zip"
    sha256 "a4c2b90ee1eed85c7b098aadd1ca329c608ff81a47e7ab5fcd9ba64cdf5fbeca"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-beta/tf-migrate_0.0.2-beta_linux_arm64.zip"
    sha256 "74fbdd195789161cef994e56b7b5cbbe0ff5dd32d819c447e08bc85c44a51f77"
  end

  conflicts_with "tf-migrate"

  def install
    bin.install "tf-migrate"
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
