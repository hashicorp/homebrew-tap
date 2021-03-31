class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "0.14.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_darwin_amd64.zip"
    sha256 "96d0b1c807415ba295a70e8afed04e233778673103587f321164ebb96be123d8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_amd64.zip"
    sha256 "47e097cfbfb64e97492934f50e646cb84df952eb76897182557811b45603dbf0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_arm.zip"
    sha256 "a58df5be281c7e2c0627cf15f755634201220f0c55ce30c7b37d3fc088bd3ef2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_arm64.zip"
    sha256 "5bcdaf46927edcc46f063faef02878620b137a84a4523004c70b6ab05b20a15c"
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
