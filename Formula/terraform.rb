class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.2/terraform_1.2.2_darwin_amd64.zip"
    sha256 "bd224d57718ed2b6e5e3b55383878d4b122c6dc058d65625605cef1ace9dcb25"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.2/terraform_1.2.2_darwin_arm64.zip"
    sha256 "4750d46e47345809a0baa3c330771c8c8a227b77bec4caa7451422a21acefae5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.2/terraform_1.2.2_linux_amd64.zip"
    sha256 "2934a0e8824925beb956b2edb5fef212a6141c089d29d8568150a43f95b3a626"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.2/terraform_1.2.2_linux_arm.zip"
    sha256 "74850f769f861c3b8b70bd298500d5fe3093815035f00ed3d9ed67097f8f9cb9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.2/terraform_1.2.2_linux_arm64.zip"
    sha256 "9c6202237d7477412054dcd36fdc269da9ee66ecbc45bb07d0d63b7d36af7b21"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
