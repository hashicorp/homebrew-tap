class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_darwin_amd64.zip"
  version "0.13.3"
  sha256 "ccbfd3af8732a47b6bd32c419e1a52e41eb8a39ff7437afffbef438b5c0f92c3"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
