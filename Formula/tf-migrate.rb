# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
  desc "Terraform Migrate"
  homepage "https://www.terraform.io"
  version "0.0.2-alpha"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-alpha/tf-migrate_0.0.2-alpha_darwin_amd64.zip"
    sha256 "f8ccc9007e18b1307486dba281470bb090562a5fc10c9e514169597f53750ef6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-alpha/tf-migrate_0.0.2-alpha_darwin_arm64.zip"
    sha256 "1a2bcd06c3de2d52fad4ccce366e9dd2059b24fc02ffe88963b2d56ec688c71b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-alpha/tf-migrate_0.0.2-alpha_linux_amd64.zip"
    sha256 "7f0c02ca0ea7efabb6a6125a77b46eccad35dc8a9f0af5c3544c1b1e54e02222"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-alpha/tf-migrate_0.0.2-alpha_linux_arm.zip"
    sha256 "26cc7bbaca6a5649eda513409bbc5dd8ffe3451a7ce84f634504971af3b324d5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/0.0.2-alpha/tf-migrate_0.0.2-alpha_linux_arm64.zip"
    sha256 "d5662a1d5b6766ff08e6920b48be2f5ed82ae28c59ac190d483a814f27e7904e"
  end

  conflicts_with "tf-migrate"

  def install
    bin.install "tf-migrate"
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
