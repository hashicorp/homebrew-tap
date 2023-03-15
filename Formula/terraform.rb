class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.4.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.1/terraform_1.4.1_darwin_amd64.zip"
    sha256 "96466364a7e66e3d456ecb6c85a63c83e124c004f8835fb8ea9b7bbb7542a9d0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.4.1/terraform_1.4.1_darwin_arm64.zip"
    sha256 "61f76e130b97c8a9017d8aaff15d252af29117e35ea1a0fc30bcaab7ceafce73"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.1/terraform_1.4.1_linux_amd64.zip"
    sha256 "9e9f3e6752168dea8ecb3643ea9c18c65d5a52acc06c22453ebc4e3fc2d34421"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.1/terraform_1.4.1_linux_arm.zip"
    sha256 "04deec30914bc10fedb7f9e3aa430d6bd58c1449378b84925654af5122aac238"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.1/terraform_1.4.1_linux_arm64.zip"
    sha256 "53322cc70b6e50ac1985bf26a78ffa2814789a4704880f071eaf3e67a463d6f6"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
