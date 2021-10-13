class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_darwin_amd64.zip"
    sha256 "fb791c3efa323c5f0c2c36d14b9230deb1dc37f096a8159e718e8a9efa49a879"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_darwin_arm64.zip"
    sha256 "aa5cc13903be35236a60d116f593e519534bcabbb2cf91b69cae19307a17b3c0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip"
    sha256 "f06ac64c6a14ed6a923d255788e4a5daefa2b50e35f32d7a3b5a2f9a5a91e255"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_arm.zip"
    sha256 "208772e1955c5b0b41bd8c28010c170c77bf09c457840f87e930cdc8116cd149"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_arm64.zip"
    sha256 "457ac590301126e7b151ea08c5b9586a882c60039a0605fb1e44b8d23d2624fd"
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
