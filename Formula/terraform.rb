class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_darwin_amd64.zip"
  version "0.14.3"
  sha256 "eda23614cd1dce1e96e7adf84f445c2783132c072fbd987f1f8858f34c361e41"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
