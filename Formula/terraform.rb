class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_darwin_amd64.zip"
    sha256 "e544aefb984fd9b19de250ac063a7aa28cbfdce2eda428dd2429a521912f6a93"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_darwin_arm64.zip"
    sha256 "1850df7904025b20b26ac101274f30673b132adc84686178d3d0cb802be4597e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_amd64.zip"
    sha256 "fa5cbf4274c67f2937cabf1a6544529d35d0b8b729ce814b40d0611fd26193c1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_arm.zip"
    sha256 "97296119835ab6961ad170b18157bdb58661175acdc120907117a758afe7d13f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_arm64.zip"
    sha256 "b940a080c698564df5e6a2f1c4e1b51b2c70a5115358d2361e3697d3985ecbfe"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
