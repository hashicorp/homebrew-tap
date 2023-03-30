# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.4.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.3/terraform_1.4.3_darwin_amd64.zip"
    sha256 "89bdb242bfacf24167f365ef7a3bf0ad0e443ddd27ebde425fb71d77ce1a2597"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.4.3/terraform_1.4.3_darwin_arm64.zip"
    sha256 "20b9d484bf99ada6c0de89316176ba33f7c87f64c0738991188465147bba221b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.3/terraform_1.4.3_linux_amd64.zip"
    sha256 "2252ee6ac8437b93db2b2ba341edc87951e2916afaeb50a88b858e80796e9111"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.3/terraform_1.4.3_linux_arm.zip"
    sha256 "5fc5c6824a869a9ea9b03933327a2a85efaabfbae03ca4927f31d9548651fc05"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.3/terraform_1.4.3_linux_arm64.zip"
    sha256 "d3d9464953d390970e7f4f7cbcd94dbf63136da6fe1cbb4955d944a9315bdcdb"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
