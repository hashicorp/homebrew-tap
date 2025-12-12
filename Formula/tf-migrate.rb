# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
  desc "Terraform Migrate"
  homepage "https://www.terraform.io"
  version "1.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/1.2.0/tf-migrate_1.2.0_darwin_amd64.zip"
    sha256 "19ec12bd6315f1a686618200b93736d6747e19a1b18d8f54cd3c033cc9234b71"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tf-migrate/1.2.0/tf-migrate_1.2.0_darwin_arm64.zip"
    sha256 "6a5c2f01e61e6b8753a183c2377fb1fa498d61533579a64ea211da0830c0c2f5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/1.2.0/tf-migrate_1.2.0_linux_amd64.zip"
    sha256 "824ef0b03c7c038e2a25405488ab47b8fbe1b9e3b96ae4c16656f5d6f33ae32f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/1.2.0/tf-migrate_1.2.0_linux_arm.zip"
    sha256 "79e68f991f1f4771b6507bf2331888acdc9f4b860c01a7b939149cd1e2caccd6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/1.2.0/tf-migrate_1.2.0_linux_arm64.zip"
    sha256 "a31e23c487d438c00296b520d46941fe7b290b433d360b4952cd9440e66378ff"
  end

  conflicts_with "tf-migrate"

  def install
    bin.install "tf-migrate"
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
