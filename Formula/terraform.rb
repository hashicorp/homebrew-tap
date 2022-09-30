class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_darwin_amd64.zip"
    sha256 "5f5967e12e75a3ca1720be3eeba8232b4ba8b42d2d9e9f9664eff7a68267e873"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_darwin_arm64.zip"
    sha256 "a525488cc3a26d25c5769fb7ffcabbfcd64f79cec5ebbfc94c18b5ec74a03b35"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_linux_amd64.zip"
    sha256 "0847b14917536600ba743a759401c45196bf89937b51dd863152137f32791899"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_linux_arm.zip"
    sha256 "88e9cbd70a456c54db92ca777ad5ed324c002533ca383675cc27c6a9105a7502"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_linux_arm64.zip"
    sha256 "7ebb3d1ff94017fbef8acd0193e0bd29dec1a8925e2b573c05a92fdb743d1d5b"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
