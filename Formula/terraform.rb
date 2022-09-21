class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_darwin_amd64.zip"
    sha256 "6502dbcbd7d1a356fa446ec12c2859a9a7276af92c89ce3cef7f675a8582a152"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_darwin_arm64.zip"
    sha256 "6a3512a1b1006f2edc6fe5f51add9a6e1ef3967912ecf27e66f22e70b9ad7158"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_amd64.zip"
    sha256 "380ca822883176af928c80e5771d1c0ac9d69b13c6d746e6202482aedde7d457"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_arm.zip"
    sha256 "92fd3389c72f508808dbf558f7e65eda6748cd853e8141fd5a62561764e5d2a6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.0/terraform_1.3.0_linux_arm64.zip"
    sha256 "0a15de6f934cf2217e5055412e7600d342b4f7dcc133564690776fece6213a9a"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
