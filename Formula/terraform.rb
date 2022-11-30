class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.6/terraform_1.3.6_darwin_amd64.zip"
    sha256 "5ab98e2d9f3b908fd6422a0562e829cc17eb055c8e242427d16d0a13506d401b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.6/terraform_1.3.6_darwin_arm64.zip"
    sha256 "f1c20b2180c982bdda8384b1316209d20fc55def4f0354ead7a2a8e04c89f54e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.6/terraform_1.3.6_linux_amd64.zip"
    sha256 "bb44a4c2b0a832d49253b9034d8ccbd34f9feeb26eda71c665f6e7fa0861f49b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.6/terraform_1.3.6_linux_arm.zip"
    sha256 "c0efeb1a94ab503c7dfb604262dee162246f3207600588a735d15ec75fe983ef"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.6/terraform_1.3.6_linux_arm64.zip"
    sha256 "f4b1af29094290f1b3935c29033c4e5291664ee2c015ca251a020dd425c847c3"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
