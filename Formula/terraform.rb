class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.13.1/terraform_0.13.1_darwin_amd64.zip"
  version "0.13.1"
  sha256 "fe5d1b6e22892c5dcc8b44d2a26ea1e29d90af6fcb1472f3881ca3c08c8a8084"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
