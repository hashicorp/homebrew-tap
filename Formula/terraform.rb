class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.11"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_darwin_amd64.zip"
    sha256 "92f2e7eebb9699e23800f8accd519775a02bd25fe79e1fe4530eca123f178202"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_darwin_arm64.zip"
    sha256 "0f38af81641b00a2cbb8d25015d917887a7b62792c74c28d59e40e56ce6f265c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip"
    sha256 "eeb46091a42dc303c3a3c300640c7774ab25cbee5083dafa5fd83b54c8aca664"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_arm.zip"
    sha256 "cce11dd382af930ef20234d84695d187bf869e366e7d91337068719ff1a7c843"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_arm64.zip"
    sha256 "30c650f4bc218659d43e07d911c00f08e420664a3d12c812228e66f666758645"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
