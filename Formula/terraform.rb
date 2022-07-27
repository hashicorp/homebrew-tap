class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.6/terraform_1.2.6_darwin_amd64.zip"
    sha256 "94d1efad05a06c879b9c1afc8a6f7acb2532d33864225605fc766ecdd58d9888"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.6/terraform_1.2.6_darwin_arm64.zip"
    sha256 "452675f91cfe955a95708697a739d9b114c39ff566da7d9b31489064ceaaf66a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.6/terraform_1.2.6_linux_amd64.zip"
    sha256 "9fd445e7a191317dcfc99d012ab632f2cc01f12af14a44dfbaba82e0f9680365"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.6/terraform_1.2.6_linux_arm.zip"
    sha256 "ed49a5422ca51cbc90472a754979f9bbba5f0c39f6a0abe570e525bbae4e6540"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.6/terraform_1.2.6_linux_arm64.zip"
    sha256 "322755d11f0da11169cdb234af74ada5599046c698dccc125859505f85da2a20"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
