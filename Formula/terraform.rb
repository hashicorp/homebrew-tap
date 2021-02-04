class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_darwin_amd64.zip"
  version "0.14.6"
  sha256 "126e1c9e058f12c247a194db5a9567e59ec755cbc0211cd5d58c8b7d37412b2c"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
