class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_darwin_amd64.zip"
    sha256 "46206e564fdd792e709b7ec70eab1c873c9b1b17f4d33c07a1faa9d68955061b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_darwin_arm64.zip"
    sha256 "e61195aa7cc5caf6c86c35b8099b4a29339cd51e54518eb020bddb35cfc0737d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_linux_amd64.zip"
    sha256 "0e0fc38641addac17103122e1953a9afad764a90e74daf4ff8ceeba4e362f2fb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_linux_arm.zip"
    sha256 "647a69acf01b3cac829f4436e8095d927ee6732cd6c076e24674a3c09326aad2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_linux_arm64.zip"
    sha256 "6da7bf01f5a72e61255c2d80eddeba51998e2bb1f50a6d81b0d3b71e70e18531"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
