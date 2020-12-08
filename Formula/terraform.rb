class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.14.1/terraform_0.14.1_darwin_amd64.zip"
  version "0.14.1"
  sha256 "3077741547eaa8885aa0f8fb9ed160b6f069a55c8e8f908a316416a13c4407ca"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
