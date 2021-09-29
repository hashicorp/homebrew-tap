class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_darwin_amd64.zip"
    sha256 "e2493c7ae12597d4a1e6437f6805b0a8bcaf01fc4e991d1f52f2773af3317342"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_darwin_arm64.zip"
    sha256 "9f0e1366484748ecbd87c8ef69cc4d3d79296b0e2c1a108bcbbff985dbb92de8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip"
    sha256 "a73459d406067ce40a46f026dce610740d368c3b4a3d96591b10c7a577984c2e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_arm.zip"
    sha256 "627f677397413d46e65f5f15e59af272ce1140abe34c8f193dd3ba7221c39b62"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_arm64.zip"
    sha256 "01aaef769f4791f9b28530e750aadbc983a8eabd0d55909e26392b333a1a26e4"
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
