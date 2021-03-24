class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_darwin_amd64.zip"
  version "0.14.9"
  sha256 "96d0b1c807415ba295a70e8afed04e233778673103587f321164ebb96be123d8"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
