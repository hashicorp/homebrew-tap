class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"

  url "https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_darwin_amd64.zip"
  version "0.13.5"
  sha256 "03f7b636638c587c3b03a4b3d1d4cab77c872ad5f7e55405ddaf38dfb94e0e89"
  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
