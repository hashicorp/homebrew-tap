class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_darwin_amd64.zip"
    sha256 "edaed5a7c4057f1f2a3826922f3e594c45e24c1e22605b94de9c097b683c38bd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_darwin_arm64.zip"
    sha256 "ff92cd79b01d39a890314c2df91355c0b6d6815fbc069ccaee9da5d8b9ff8580"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_linux_amd64.zip"
    sha256 "6372e02a7f04bef9dac4a7a12f4580a0ad96a37b5997e80738e070be330cb11c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_linux_arm.zip"
    sha256 "03df79e7e24819225902e77d437452ce3df98b71dd1f6deb3616b520fe4ef6e9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_linux_arm64.zip"
    sha256 "ce1a8770aaf27736a3352c5c31e95fb10d0944729b9d81013bf6848f8657da5f"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
