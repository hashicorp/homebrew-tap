class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.8/terraform_0.14.8_darwin_amd64.zip"
  version "0.14.8"
  sha256 "30115a2ee5f61178527089d8e5da20053927b364b08dc7aee6894a162ccbd793"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
