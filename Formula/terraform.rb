class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_darwin_amd64.zip"
    sha256 "acc781e964be9b527101b00eb6e7e63e7e509dd1355ff8567b80d0244c460634"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_darwin_arm64.zip"
    sha256 "e4717057e1cbb606f1e089261def9a17ddd18b78707d9e212c768dc0d739a220"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_amd64.zip"
    sha256 "dfd7c44a5b6832d62860a01095a15b53616fb3ea4441ab89542f9364e3fca718"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_arm.zip"
    sha256 "c2557f3f878330a66a02de3c08ae8d0824b658c66fcb36b1eb07939bf2bc0468"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_arm64.zip"
    sha256 "80d064008d57ba5dc97e189215c87275bf39ca14b1234430eae2f114394ea229"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
