# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.10.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.4/terraform_1.10.4_darwin_amd64.zip"
    sha256 "3e3d54a96b62b205636ce0fa9b64b85c23cb7e8ad0d63eb74d70080ff1ebfa3e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.10.4/terraform_1.10.4_darwin_arm64.zip"
    sha256 "3264fe6a903665ef91d18eebd99c494976f9d96f5dac603e4f1e283682404009"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.4/terraform_1.10.4_linux_amd64.zip"
    sha256 "64b7b60f35eb92e94a046b6c932ce53f632a9eb528e9d0097857f9f27420be3e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.4/terraform_1.10.4_linux_arm.zip"
    sha256 "f9fe24acb04707194c82dfcf945509a5fa4ad31a0d95abec519a8aa5cffa1672"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.4/terraform_1.10.4_linux_arm64.zip"
    sha256 "3c554a8b9ba2b2b03cdfe2b7cfa9b3cc40e98af99e4a52e21e365b97af2b3669"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
