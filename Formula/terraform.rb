class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.4.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_darwin_amd64.zip"
    sha256 "c218a6c0ef6692b25af16995c8c7bdf6739e9638fef9235c6aced3cd84afaf66"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_darwin_arm64.zip"
    sha256 "af8ff7576c8fc41496fdf97e9199b00d8d81729a6a0e821eaf4dfd08aa763540"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip"
    sha256 "9f3ca33d04f5335472829d1df7785115b60176d610ae6f1583343b0a2221a931"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_arm.zip"
    sha256 "dbb1e7179279bd739ff889b994738f25a80a8eac5ae255b50bdf5f86b9eda28b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_arm64.zip"
    sha256 "39c182670c4e63e918e0a16080b1cc47bb16e158d7da96333d682d6a9cb8eb91"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
