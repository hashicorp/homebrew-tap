class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.0/terraform_1.4.0_darwin_amd64.zip"
    sha256 "b063c2018ed6229a6d92defee0b2a115a0a18169ed02e93ecf3899ca3e2a87de"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.4.0/terraform_1.4.0_darwin_arm64.zip"
    sha256 "ec02ccdcc368ce307d03c1e981f3a863d9c07b312635d4aca24159ada7657562"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.0/terraform_1.4.0_linux_amd64.zip"
    sha256 "5da60da508d6d1941ffa8b9216147456a16bbff6db7622ae9ad01d314cbdd188"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.0/terraform_1.4.0_linux_arm.zip"
    sha256 "e414df694001031fe530e05f19ec0fd0b8f115a3898149ee30226bb367da2f35"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.0/terraform_1.4.0_linux_arm64.zip"
    sha256 "33e0f4f0b75f507fc19012111de008308df343153cd6a3992507f4566c0bb723"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
