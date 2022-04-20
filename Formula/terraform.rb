class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_darwin_amd64.zip"
    sha256 "c902b3c12042ac1d950637c2dd72ff19139519658f69290b310f1a5924586286"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_darwin_arm64.zip"
    sha256 "918a8684da5a5529285135f14b09766bd4eb0e8c6612a4db7c121174b4831739"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip"
    sha256 "9d2d8a89f5cc8bc1c06cb6f34ce76ec4b99184b07eb776f8b39183b513d7798a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_arm.zip"
    sha256 "800eee18651b5e552772c60fc1b5eb00cdcefddf11969412203c6de6189aa10a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_arm64.zip"
    sha256 "e8a09d1fe5a68ed75e5fabe26c609ad12a7e459002dea6543f1084993b87a266"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
