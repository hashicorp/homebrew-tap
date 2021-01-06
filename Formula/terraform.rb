class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_darwin_amd64.zip"
  version "0.14.4"
  sha256 "948d4550b7cd0f9152741c4a5e4fe80167b1cbb7513f939ffef1d50f94c4fb0c"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
