class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_darwin_amd64.zip"
    sha256 "b00465acc7bdef57ba468b84b9162786e472dc97ad036a9e3526dde510563e2d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_darwin_arm64.zip"
    sha256 "6cda396999c9a27cb90c4902913c10ac0afe1bfceb957ed50a4298c5872979cf"
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
