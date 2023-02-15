class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.3.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_darwin_amd64.zip"
    sha256 "ca78815afd657f887de7f9b74014dc4bddffe80fd28028179b271a3c4f64f29a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_darwin_arm64.zip"
    sha256 "9df6fc8a9264bba1058e6e9383f43af2ee816088e61925e5bc45128ad8b6e9ad"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_amd64.zip"
    sha256 "53048fa573effdd8f2a59b726234c6f450491fe0ded6931e9f4c6e3df6eece56"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_arm.zip"
    sha256 "58203da8e5468ab5c22d26d242bf64e305c038d99717199f6783a3686130b60e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_arm64.zip"
    sha256 "da571087268c5faf884912c4239c6b9c8e1ed8e8401ab1dcb45712df70f42f1b"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
