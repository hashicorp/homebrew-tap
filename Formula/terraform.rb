class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_darwin_amd64.zip"
    sha256 "0f8eecc764b57a938aa115a3ce2baa0d245479f17c28a4217bcf432ee23c2c5d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_darwin_arm64.zip"
    sha256 "d6b900682d33aff84f8f63f69557f8ea8537218748fcac6f12483aaa46959a14"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_linux_amd64.zip"
    sha256 "3e9c46d6f37338e90d5018c156d89961b0ffb0f355249679593aff99f9abe2a2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_linux_arm.zip"
    sha256 "188d6a4cbaea522a61981b3376c1be63a28db2b30b209a16c030a54494bb96a4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_linux_arm64.zip"
    sha256 "26c05cadb05cdaa8ac64b90b982b4e9350715ec2e9995a6b03bb964d230de055"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
