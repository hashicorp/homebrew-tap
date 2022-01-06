class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_darwin_amd64.zip"
    sha256 "c54022e514a97e9b96dae24a3308227d034989ecbafb65e3293eea91f2d5edfb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_darwin_arm64.zip"
    sha256 "856e435da081d0a214c47a4eb09b1842f35eaa55e7ef0f9fa715d4816981d640"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_linux_amd64.zip"
    sha256 "b215de2a18947fff41803716b1829a3c462c4f009b687c2cbdb52ceb51157c2f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_linux_arm.zip"
    sha256 "a245b86fe0d11348543c0991321fd7231ce31f1ce3f36bd7337f5929ddb34348"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.3/terraform_1.1.3_linux_arm64.zip"
    sha256 "ad5a1f2c132bedc5105e3f9900e4fe46858d582c0f2a2d74355da718bbcef65d"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
