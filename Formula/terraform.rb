class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_darwin_amd64.zip"
    sha256 "c2b2500835d2eb9d614f50f6f74c08781f0fee803699279b3eb0188b656427f2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_darwin_arm64.zip"
    sha256 "a753e6cf402beddc4043a3968ff3e790cf50cc526827cda83a0f442a893f2235"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip"
    sha256 "fca028d622f82788fdc35c1349e78d69ff07c7bb68c27d12f8b48c420e3ecdfb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_arm.zip"
    sha256 "390d8d177b26fcefe80d6a5b8d333b9ce29058a99f9d52f9b3e10e92ebcdf3cf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_arm64.zip"
    sha256 "3c1982cf0d16276c82960db60c998d79ba19e413af4fa2c7f6f86e4994379437"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
