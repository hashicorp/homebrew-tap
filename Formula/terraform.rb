class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_darwin_amd64.zip"
  version "0.14.7"
  sha256 "8a5ec04afcc9c2653bb927844eb76ad51e12bcaec0638103512d7b160dd530ea"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
