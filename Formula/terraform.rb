class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.8/terraform_1.1.8_darwin_amd64.zip"
    sha256 "29ad0af72d498a76bbc51cc5cb09a6d6d0e5673cbbab6ef7aca57e3c3e780f46"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.8/terraform_1.1.8_darwin_arm64.zip"
    sha256 "d6fefdc27396a019da56cce26f7eeea3d6986714cbdd488ff6a424f4bca40de8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.8/terraform_1.1.8_linux_amd64.zip"
    sha256 "fbd37c1ec3d163f493075aa0fa85147e7e3f88dd98760ee7af7499783454f4c5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.8/terraform_1.1.8_linux_arm.zip"
    sha256 "c2dac55b0ba4e625d0afe77eb4eb3f65ea4e3b5ed930de6217ceeb46c19d55e8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.8/terraform_1.1.8_linux_arm64.zip"
    sha256 "10b2c063dcff91329ee44bce9d71872825566b713308b3da1e5768c6998fb84f"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
