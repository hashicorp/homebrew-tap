# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.6.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_darwin_amd64.zip"
    sha256 "0a93865c56fac0cec9faa739fa81bf69fe58614e9e8d74c088b6c414055b5453"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_darwin_arm64.zip"
    sha256 "c3c6196b71946c7825d1e9a1d7d03be1c68b07fd4528a7bbf918f718c4164ffa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_amd64.zip"
    sha256 "569fc3d526dcf57eb5af4764843b87b36a7cb590fc50f94a07757c1189256775"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_arm.zip"
    sha256 "98a9dbe23cdee6b9a89f2c474eb2e1077f64e4e1e74e4356bc7539cc7d31985c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_linux_arm64.zip"
    sha256 "823606826b03c333689152c539892edb6ea81c085e4b3b7482ba7aa4b216b762"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
