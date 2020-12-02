class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.0/terraform_0.14.0_darwin_amd64.zip"
  version "0.14.0"
  sha256 "e728f9c5f64b9a7507f7038ad243743b4bcad0057fe7cc83021eb825cc2b6b9c"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
