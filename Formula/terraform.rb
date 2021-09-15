class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_darwin_amd64.zip"
    sha256 "80ae021d6143c7f7cbf4571f65595d154561a2a25fd934b7a8ccc1ebf3014b9b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_darwin_arm64.zip"
    sha256 "cbab9aca5bc4e604565697355eed185bb699733811374761b92000cc188a7725"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip"
    sha256 "bc79e47649e2529049a356f9e60e06b47462bf6743534a10a4c16594f443be7b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_arm.zip"
    sha256 "be8d9de8c34e3e843ff8cbc713b41ce0c2bd97b0020c80e934443976b4429ae2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_arm64.zip"
    sha256 "4e71a9e759578020750be41e945c086e387affb58568db6d259d80d123ac80d3"
  end

  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
