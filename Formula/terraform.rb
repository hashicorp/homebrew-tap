class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_darwin_amd64.zip"
    sha256 "ae0b07ba099d3d9241e5e8bcdfc88ada8fcbbe302cb1d8f822da866a25e55330"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_darwin_arm64.zip"
    sha256 "3de4b9f167392622ef49d807e438a166e6c86c631afa730ff3189cf72cc950e2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip"
    sha256 "7ce24478859ab7ca0ba4d8c9c12bb345f52e8efdc42fa3ef9dd30033dbf4b561"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_arm.zip"
    sha256 "e34b5274e2fb76d7e6779697304c8f843ee52b523cf212d0bc868c6f4c533ad5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_arm64.zip"
    sha256 "f6c56ebb17d6109d908c2936bbdab74f6f7813c542db85ef6cef3dd020359eb2"
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
