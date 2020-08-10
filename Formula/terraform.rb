class Terraform < Formula
    desc "Terraform"
    homepage "https://www.terraform.io/"
    version "0.13.0"
    bottle :unneeded

    url "https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_darwin_amd64.zip"
    sha256 "080af0420732cd08941aa4c0d2b4693056b24366724faa11b107bf052f7de203"

    conflicts_with "terraform"

    def install
      bin.install "terraform"
    end

    test do
      system "#{bin}/terraform --version"
    end
  end
