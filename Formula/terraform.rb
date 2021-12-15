class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.1/terraform_1.1.1_darwin_amd64.zip"
    sha256 "85fa7c90359c4e3358f78e58f35897b3e466d00c0d0648820830cac5a07609c3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.1/terraform_1.1.1_darwin_arm64.zip"
    sha256 "9cd8faf29095c57e30f04f9ca5fa9105f6717b277c65061a46f74f22f0f5907e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.1/terraform_1.1.1_linux_amd64.zip"
    sha256 "07b8dc444540918597a60db9351af861335c3941f28ea8774e168db97dd74557"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.1/terraform_1.1.1_linux_arm.zip"
    sha256 "debb5332cba6d1eb7f1560feaa0ba1212e55379a3582887bd806b8dd681ff6b5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.1/terraform_1.1.1_linux_arm64.zip"
    sha256 "d6fd14da47af9ec5fa3ad5962eaef8eed6ff2f8a5041671f9c90ec5f4f8bb554"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
