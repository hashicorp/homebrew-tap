class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_darwin_amd64.zip"
    sha256 "3a97f2fffb75ac47a320d1595e20947afc8324571a784f1bd50bd91e26d5648c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_darwin_arm64.zip"
    sha256 "aaff1eccaf4099da22fe3c6b662011f8295dad9c94a35e1557b92844610f91f3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_linux_amd64.zip"
    sha256 "6a454323d252d34e928785a3b7c52bfaff1192f82685dfee4da1279bb700b733"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_linux_arm.zip"
    sha256 "10c67773334e2f4ee6c39815327f2cc1df242d97df997666d730fbc2b97558db"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_linux_arm64.zip"
    sha256 "2047f8afc7d0d7b645a0422181ba3fe47b3547c4fe658f95eebeb872752ec129"
  end

  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
