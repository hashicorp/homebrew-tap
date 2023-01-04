class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_darwin_amd64.zip"
    sha256 "aa111cd80d84586697d1643c6c21452d34f70e5bc639e4106856f59382351397"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_darwin_arm64.zip"
    sha256 "8860db524d1a51435cbed731902c7de1595348c09dd5b3a342024405c8e7ef74"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip"
    sha256 "b8cf184dee15dfa89713fe56085313ab23db22e17284a9a27c0999c67ce3021e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_arm.zip"
    sha256 "80f981e15f6da52f1825de9bbf582449a8da934a9664214b0a417f21cede8e18"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_arm64.zip"
    sha256 "5b491c555ea8a62dda551675fd9f27d369f5cdbe87608d2a7367d3da2d38ea38"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
