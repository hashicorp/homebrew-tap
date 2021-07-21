class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_darwin_amd64.zip"
    sha256 "1de66203cf7f62ad990b6d8b583bc2caaadf8594150323f4d632a869448b85b9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_darwin_arm64.zip"
    sha256 "bf330b9d9bf24e87abf155de3828be2afa5a61d07df4d8cfe3d61e32bf71e687"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_amd64.zip"
    sha256 "99c4866ffc4d3a749671b1f74d37f907eda1d67d7fc29ed5485aeff592980644"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_arm.zip"
    sha256 "10587a94d08b00bcf37792c125c9b33f7c672b27b97f65bd9acb02d78cd70fd9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_arm64.zip"
    sha256 "521a52dc6996c105b059096f7f92c0a382aa0903053ff85755fb2c631d0d1190"
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
