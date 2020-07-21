class Terraform < Formula
    desc "Terraform"
    homepage "https://www.terraform.io/"
    version "0.12.28"
    bottle :unneeded
    if OS.mac?
      url "https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_darwin_amd64.zip"
      sha256 "893050bcfc5e7445acd3a30f1500227b989b29cbd958ca64a8233589194a198d"
    end
    conflicts_with "terraform"
    def install
      bin.install "terraform"
    end
    test do
      system "#{bin}/terraform --version"
    end
  end
