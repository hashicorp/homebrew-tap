class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_darwin_amd64.zip"
    sha256 "cf7c7750c6380a12d6a4534c63844c803f14f5c5a8f71e32f7ad237ae81ae7a9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_darwin_arm64.zip"
    sha256 "8b0a06a75fc6ae50cb75d2a3fb64d66fbe443bcda6d12d9e637cd3a701a29567"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip"
    sha256 "5c0be4d52de72143e2cd78e417ee2dd582ce229d73784fd19444445fa6e1335e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_arm.zip"
    sha256 "4829e9ab71b1c13ea43e5c1085bc78fa81c1d001686d96276010ebe76b46c66d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_arm64.zip"
    sha256 "4e0132f0023077030df92a5b2f2b34431310da198ecf22aaf363b6adc374430f"
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
