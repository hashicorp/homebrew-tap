class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_darwin_amd64.zip"
    sha256 "f608b1fee818988d89a16b7d1b6d22b37cc98892608c52c22661ca6cbfc3d216"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_darwin_arm64.zip"
    sha256 "d4df7307bad8c13e443493c53898a7060f77d661bfdf06215b61b65621ed53e9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_linux_amd64.zip"
    sha256 "b87de03adbdfdff3c2552c8c8377552d0eecd787154465100cf4e29de4a7be1f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_linux_arm.zip"
    sha256 "63d985bb18da6ab4e6baa5778726ad97403f3853ac3caef22fdf39baa6c7123e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_linux_arm64.zip"
    sha256 "ee80b8635d8fdbaed57beffe281cf87b8b1fd1ddb29c08d20e25a152d9f0f871"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
