class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.5/terraform_0.14.5_darwin_amd64.zip"
  version "0.14.5"
  sha256 "363d0e0c5c4cb4e69f5f2c7f64f9bf01ab73af0801665d577441521a24313a07"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
