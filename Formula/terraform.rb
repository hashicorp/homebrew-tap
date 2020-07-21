class Terraform < Formula
    desc "Terraform"
    homepage "https://www.terraform.io/"
    version "0.12.28"
    bottle :unneeded
    if OS.mac?
      url "https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_darwin_amd64.zip"
      sha256 "893050bcfc5e7445acd3a30f1500227b989b29cbd958ca64a8233589194a198d"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip"
        sha256 "be99da1439a60942b8d23f63eba1ea05ff42160744116e84f46fc24f1a8011b6"
      end
    end
    conflicts_with "terraform"
    def install
      bin.install "terraform"
    end
    test do
      system "#{bin}/terraform --version"
    end
  end
