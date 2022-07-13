class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_darwin_amd64.zip"
    sha256 "d196f94486e54407524a0efbcb5756b197b763863ead2e145f86dd6c80fc9ce8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_darwin_arm64.zip"
    sha256 "77dd998d26e578aa22de557dc142672307807c88e3a4da65d8442de61479899f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_linux_amd64.zip"
    sha256 "281344ed7e2b49b3d6af300b1fe310beed8778c56f3563c4d60e5541c0978f1b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_linux_arm.zip"
    sha256 "3c9f27b88fc5a56b7e7494e067e3df2136b62f726fe4986b2404d38fcec6f824"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.5/terraform_1.2.5_linux_arm64.zip"
    sha256 "0544420eb29b792444014988018ae77a7c8df6b23d84983728695ba73e38f54a"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
