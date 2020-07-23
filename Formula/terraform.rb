class Terraform < Formula
    desc "Terraform"
    homepage "https://www.terraform.io/"
    version "0.12.29"
    bottle :unneeded

    url "https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_darwin_amd64.zip"
    sha256 "fdcda98ff7b7e65832248f64ef6c2922e05036de25d40c5cdcd732c5117150aa"

    conflicts_with "terraform"

    def install
      bin.install "terraform"
    end

    test do
      system "#{bin}/terraform --version"
    end
  end
