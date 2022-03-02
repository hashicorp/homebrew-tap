class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_darwin_amd64.zip"
    sha256 "5e7e939e084ae29af7fd86b00a618433d905477c52add2d4ea8770692acbceac"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_darwin_arm64.zip"
    sha256 "a36b6e2810f81a404c11005942b69c3d1d9baa8dd07de6b1f84e87a67eedb58f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip"
    sha256 "e4add092a54ff6febd3325d1e0c109c9e590dc6c38f8bb7f9632e4e6bcca99d4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_arm.zip"
    sha256 "81013a3d554a2a40ac9f59dd1dbadf3e4f43d6e04c14d746a8eeffc45788f8cb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_arm64.zip"
    sha256 "2f72982008c52d2d57294ea50794d7c6ae45d2948e08598bfec3e492bce8d96e"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
