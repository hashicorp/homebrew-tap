# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TfMigrate < Formula
    desc "TfMigrate"
    homepage "https://www.terraform.io"
    version "1.19.1"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://releases.hashicorp.com/tf-migrate/0.0.1-alpha/tf-migrate_0.0.1-alpha_darwin_amd64.zip"
      sha256 "6ac35f82fd1ddebd21d7c1422fcf98f516965fab8c7b3d8770e7f0b5da157408"
    end
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://releases.hashicorp.com/tf-migrate/0.0.1-alpha/tf-migrate_0.0.1-alpha_darwin_arm64.zip"
      sha256 "e5faccbd20d7e82b86e06f87fd74dfbfd4077a233f16fd59b2bdc6a1239eecd9"
    end
  
    if OS.linux? && Hardware::CPU.intel?
      url "https://releases.hashicorp.com/tf-migrate/0.0.1-alpha/tf-migrate_0.0.1-alpha_linux_amd64.zip"
      sha256 "1431098d9d5299ce60652fa40b13b349cfa2a92b25f1de6c410f18c346296818"
    end
  
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/tf-migrate/0.0.1-alpha/tf-migrate_0.0.1-alpha_linux_arm.zip"
      sha256 "fc8b1235c44bf67b34dea908d4ed8cbd9b48262c5ff579ed3f6dc0d8b1662298"
    end
  
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/tf-migrate/0.0.1-alpha/tf-migrate_0.0.1-alpha_linux_arm64.zip"
      sha256 "24f0fa2258faf3a4d2adbec88636f8ef7c6556c079c56499e38097610898c83e"
    end
  
    conflicts_with "tf-migrate"
  
    def install
      bin.install "tf-migrate"
    end
  
    test do
      system "#{bin}/tf-migrate --version"
    end
  end
  