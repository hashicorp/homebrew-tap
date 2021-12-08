class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_darwin_amd64.zip"
    sha256 "6fb2af160879d807291980642efa93cc9a97ddf662b17cc3753065c974a5296d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_darwin_arm64.zip"
    sha256 "f69e0613f09c21d44ce2131b20e8b97909f3fc7aa90c443639475f5e474a22ec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_linux_amd64.zip"
    sha256 "763378aa75500ce5ba67d0cba8aa605670cd28bf8bafc709333a30908441acb5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_linux_arm.zip"
    sha256 "40e7b0c745832dbeaeca0e74b6a93267942236573486390806d63e0f87427d7a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_linux_arm64.zip"
    sha256 "6697e9a263e264310373f3c91bf83f4cbfeb67b13994d2a8f7bcc492b554552e"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
