class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "0.15.4"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_darwin_amd64.zip"
    sha256 "c7e413ad9d00a5ba177a32b0d46ff177239bd53a1aab67e7c5efad2e1e25978e"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip"
    sha256 "ddf9b409599b8c3b44d4e7c080da9a106befc1ff9e53b57364622720114e325c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_arm.zip"
    sha256 "6d32766dc0f8eef754860a90a84fec623695a175ec246c4faac1ab5959110b4e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_arm64.zip"
    sha256 "8bbbaf8b48f857b4044983cc757c5f05da5ab877449b9d9847c680b8955edc85"
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
