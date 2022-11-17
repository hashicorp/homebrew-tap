class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_darwin_amd64.zip"
    sha256 "6bf684dbc19ecbf9225f5a2409def32e5ef7d37af3899726accd9420a88a6bcd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_darwin_arm64.zip"
    sha256 "33b25ad89dedbd98bba09cbde69dcf9e928029f322ae9494279cf2c8ce47db89"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_amd64.zip"
    sha256 "ac28037216c3bc41de2c22724e863d883320a770056969b8d211ca8af3d477cf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_arm.zip"
    sha256 "8e866d0753ccf6e92de19dc9dd8ce7a406bf668b315d31f947c1f67a067416e6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_arm64.zip"
    sha256 "ba5b1761046b899197bbfce3ad9b448d14550106d2cc37c52a60fc6822b584ed"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
