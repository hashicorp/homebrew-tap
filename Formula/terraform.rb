class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.10"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.10/terraform_1.0.10_darwin_amd64.zip"
    sha256 "e7595530a0dcdaec757621cbd9f931926fd904b1a1e5206bf2c9db6b73cee04d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.10/terraform_1.0.10_darwin_arm64.zip"
    sha256 "eecea1343888e2648d5f7ea25a29494fd3b5ecde95d0231024414458c59cb184"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.10/terraform_1.0.10_linux_amd64.zip"
    sha256 "a221682fcc9cbd7fde22f305ead99b3ad49d8303f152e118edda086a2807716d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.10/terraform_1.0.10_linux_arm.zip"
    sha256 "4bcf91e002f0111e13abb40e7867405c019911f7748830ab79b22ff5972aaf66"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.10/terraform_1.0.10_linux_arm64.zip"
    sha256 "b091dbe5c00785ae8b5cb64149d697d61adea75e495d9e3d910f61d8c9967226"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
