class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_darwin_amd64.zip"
  version "0.13.4"
  sha256 "d16d3094b0f9f56d7e05b4c09a923141a483f51e58613ae64507b0f7ba45bb34"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
