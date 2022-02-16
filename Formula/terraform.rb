class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_darwin_amd64.zip"
    sha256 "bbfc916117e45788661c066ec39a0727f64c7557bf6ce9f486bbd97c16841975"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_darwin_arm64.zip"
    sha256 "dddb11195fc413653b98e7a830ec7314f297e6c22575fc878f4ee2287a25b4f5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_linux_amd64.zip"
    sha256 "3e330ce4c8c0434cdd79fe04ed6f6e28e72db44c47ae50d01c342c8a2b05d331"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_linux_arm.zip"
    sha256 "2b977ed400747f03374262f171d3deba710f303a0be2daafe9ae2fd65ed851f3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.6/terraform_1.1.6_linux_arm64.zip"
    sha256 "a53fb63625af3572f7252b9fb61d787ab153132a8984b12f4bb84b8ee408ec53"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
