# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
  desc "Terraform Migrate"
  homepage "https://www.terraform.io"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/1.1.0/tf-migrate_1.1.0_darwin_amd64.zip"
    sha256 "2b7a25825ed9319976c7d273e25690bd3a8769edf385b0dba7ffb89b3162b95a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tf-migrate/1.1.0/tf-migrate_1.1.0_darwin_arm64.zip"
    sha256 "171b18106acc633c60094dd7a3f057e36af16b21751bad1a0f053d5bf98a7e94"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tf-migrate/1.1.0/tf-migrate_1.1.0_linux_amd64.zip"
    sha256 "eed4a16658a4f4f8e199a9da8ce8c8b47c8b22aaa0b1da7efd7e691163b24e8b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/1.1.0/tf-migrate_1.1.0_linux_arm.zip"
    sha256 "a6a64482aa64a3d82525799298e2b957a0cf14ac4f852ad56b7cf3663c9f4a8b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tf-migrate/1.1.0/tf-migrate_1.1.0_linux_arm64.zip"
    sha256 "e99a0c362f29a81717002eec9504993c18bfa184a0af0dbc01017ccef89280ed"
  end

  conflicts_with "tf-migrate"

  def install
    bin.install "tf-migrate"
  end

  test do
    system "#{bin}/tf-migrate --version"
  end
end
