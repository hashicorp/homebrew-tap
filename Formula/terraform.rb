class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.3/terraform_1.2.3_darwin_amd64.zip"
    sha256 "2962b0ebdf6f431b8fb182ffc1d8b582b73945db0c3ab99230ffc360d9e297a2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.3/terraform_1.2.3_darwin_arm64.zip"
    sha256 "601962205ad3dcf9b1b75f758589890a07854506cbd08ca2fc25afbf373bff53"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.3/terraform_1.2.3_linux_amd64.zip"
    sha256 "728b6fbcb288ad1b7b6590585410a98d3b7e05efe4601ef776c37e15e9a83a96"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.3/terraform_1.2.3_linux_arm.zip"
    sha256 "a28b2e9163d6fc351bc791e827b01f7a356b9d76d89fa94f94bfe6dc50756d53"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.3/terraform_1.2.3_linux_arm64.zip"
    sha256 "a48991e938a25bfe5d257f4b6cbbdc73d920cc34bbc8f0e685e28b9610ad75fe"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
