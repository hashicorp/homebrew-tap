class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.13.2/terraform_0.13.2_darwin_amd64.zip"
  version "0.13.2"
  sha256 "7af2f9c03e8687c87e7798178a2dac9a3061955eb19f0f69501475e017b8d8f6"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
