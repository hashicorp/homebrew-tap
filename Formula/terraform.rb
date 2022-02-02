class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_darwin_amd64.zip"
    sha256 "7d4dbd76329c25869e407706fed01213beb9d6235c26e01c795a141c2065d053"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_darwin_arm64.zip"
    sha256 "723363af9524c0897e9a7d871d27f0d96f6aafd11990df7e6348f5b45d2dbe2c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip"
    sha256 "30942d5055c7151f051c8ea75481ff1dc95b2c4409dbb50196419c21168d6467"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_arm.zip"
    sha256 "7b58756f4123ff6fe8680aea0bde91d12ecad28b1a1d25e33465c812f88fe387"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_arm64.zip"
    sha256 "2fb6324c24c14523ae63cedcbc94a8e6c1c317987eced0abfca2f6218d217ca5"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
