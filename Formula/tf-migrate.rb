# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
  desc "Terraform Migrate"
  homepage "https://www.terraform.io"
  version "2.0.0-rc1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-rc1/tf-migrate_2.0.0-rc1_darwin_amd64.zip"
    sha256 "0c3fa09d8bca2d7925390c96f23f5b399526fc15c04cd4d2855ce318a7aa31f0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-rc1/tf-migrate_2.0.0-rc1_darwin_arm64.zip"
    sha256 "95e5ed3b6e0ad676982f925f9cf1cce79907563e06e9e95b63eb6f868991165a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-rc1/tf-migrate_2.0.0-rc1_linux_amd64.zip"
    sha256 "12e4d1a63bf1bcd654bf93bedfec849548ceae9892082110fac1cefa60020163"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-rc1/tf-migrate_2.0.0-rc1_linux_arm.zip"
    sha256 "92b64dd9ab82075d8e53bd753ceffb2b475a80d2ed2de9d98b1054047042b636"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-rc1/tf-migrate_2.0.0-rc1_linux_arm64.zip"
    sha256 "70417a6b0364b077888257e4d1484c16fc0279e2cecaf5f6dc04d245d57c2c69"
  end

  conflicts_with "tf-migrate"

  def install
    bin.install "tf-migrate"
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
