# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
  desc "Terraform Migrate"
  homepage "https://www.terraform.io"
  version "2.0.0-beta2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta2/tf-migrate_2.0.0-beta2_darwin_amd64.zip"
    sha256 "49003e2891b19c7c0095132bc5a4182704c05ff40e9409a73ddde64d4492d1db"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta2/tf-migrate_2.0.0-beta2_darwin_arm64.zip"
    sha256 "70921196babd940838dd19f81590702b12eca5f9402ac2eb5be84d7fc6dfe82b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta2/tf-migrate_2.0.0-beta2_linux_amd64.zip"
    sha256 "b1741c6f95fd469c41576315bb0753c0b16152832854e07e847992f87b8877ee"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta2/tf-migrate_2.0.0-beta2_linux_arm.zip"
    sha256 "2197f3c549617137ab7c260e3a7424782918103141a0f1c5d26c6fedbea40ebb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/2.0.0-beta2/tf-migrate_2.0.0-beta2_linux_arm64.zip"
    sha256 "9bb4a195b3928d3684a3b0b3ad3b10a87466b56bd1f9df43622e9a45d8dd5dbc"
  end

  conflicts_with "tf-migrate"

  def install
    bin.install "tf-migrate"
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
