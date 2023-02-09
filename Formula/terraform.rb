class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.8/terraform_1.3.8_darwin_amd64.zip"
    sha256 "3cb29f95962947b0dbdf3f83338121879426d723ba60007e7c264c3c8a2add8f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.8/terraform_1.3.8_darwin_arm64.zip"
    sha256 "4547a47be08350a3eb6e44fd28e957cf515c3a2b52e04f134366a08b1fbf03ec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.8/terraform_1.3.8_linux_amd64.zip"
    sha256 "9d9e7d6a9b41cef8b837af688441d4fbbd84b503d24061d078ad662441c70240"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.8/terraform_1.3.8_linux_arm.zip"
    sha256 "5b43d9f0e9dbfa56a40fa41de603ca7a36cffe4428036a768cc09f185800af11"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.8/terraform_1.3.8_linux_arm64.zip"
    sha256 "a42bf3c7d6327f45d2b212b692ab4229285fb44dbb8adb7c39e18be2b26167c8"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
