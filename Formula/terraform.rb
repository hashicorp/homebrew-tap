class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.4/terraform_1.3.4_darwin_amd64.zip"
    sha256 "03e0d7f629f28e2ea31ec2c69408b500f00eac674c613f7f1097536dcfa2cf6c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.4/terraform_1.3.4_darwin_arm64.zip"
    sha256 "7b4401edd8de50cda97d76b051c3a4b1882fa5aa8e867d4c4c2770e4c3b0056e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.4/terraform_1.3.4_linux_amd64.zip"
    sha256 "b24210f28191fa2a08efe69f54e3db2e87a63369ac4f5dcaf9f34dc9318eb1a8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.4/terraform_1.3.4_linux_arm.zip"
    sha256 "ab67fc5fca76c57bfed1ecb02b3263d8a2cb671b30466711e7811de597efb9c1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.4/terraform_1.3.4_linux_arm64.zip"
    sha256 "65381c6b61b2d1a98892199f649a5764ff5a772080a73d70f8663245e6402c39"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
