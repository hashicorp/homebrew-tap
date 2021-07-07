class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.2/terraform_1.0.2_darwin_amd64.zip"
    sha256 "90e58796d84db0a16b5ad40140182061533c38210680980e099812c43b43ff7a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.2/terraform_1.0.2_darwin_arm64.zip"
    sha256 "eace5976af85f9eaf87ac20f6b6899562b8f18500af2fe4eee9e20b61d510b99"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.2/terraform_1.0.2_linux_amd64.zip"
    sha256 "7329f887cc5a5bda4bedaec59c439a4af7ea0465f83e3c1b0f4d04951e1181f4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.2/terraform_1.0.2_linux_arm.zip"
    sha256 "49977b07651b6662f4d268f49e90b4a057954901347d4c18a54a49cf29b96408"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.2/terraform_1.0.2_linux_arm64.zip"
    sha256 "291bcbb4dac589e72aa7c958e9392c77e3afb27694b85a3bf013656f4fd9bf95"
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
