class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_darwin_amd64.zip"
    sha256 "d7c9a677efb22276afdd6c7703cbfee87d509a31acb247b96aa550a35154400a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_darwin_arm64.zip"
    sha256 "96e3659e89bfb50f70d1bb8660452ec433019d00a862d2291817c831305d85ea"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_linux_amd64.zip"
    sha256 "8cf8eb7ed2d95a4213fbfd0459ab303f890e79220196d1c4aae9ecf22547302e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_linux_arm.zip"
    sha256 "6d90bc9e711fdaef1f1c0bff099e7d7910837562e5c61b00ebd3a6b4c88e01ff"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_linux_arm64.zip"
    sha256 "972ea512dac822274791dedceb6e7f8b9ac2ed36bd7759269b6806d0ab049128"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
