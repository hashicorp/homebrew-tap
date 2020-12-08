class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.2/terraform_0.14.2_darwin_amd64.zip"
  version "0.14.2"
  sha256 "31a7691f891f4e4c5d77b5eab9ecc86516df638a0b7cbde120c9e14bef68f7ac"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
