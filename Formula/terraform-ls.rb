class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.30.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.0/terraform-ls_0.30.0_darwin_amd64.zip"
    sha256 "b1baadbe3ee9ab753f6eb7face1cf39fc9be30569beec1eb2273ccf94e6e6466"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.30.0/terraform-ls_0.30.0_darwin_arm64.zip"
    sha256 "7d18c37f79a1c056568349ecaf6d8015e28046d288a7a57b42ae17b632da5e7a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.0/terraform-ls_0.30.0_linux_amd64.zip"
    sha256 "b6d4f161d42c7f2db2c933f09ab0157edbceae071a59b968fb2f5b20aa23ad3d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.30.0/terraform-ls_0.30.0_linux_arm.zip"
    sha256 "35bdbffdb9d56371c794897ded0c742862c88495eaa9daa538611fd647e39df1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.30.0/terraform-ls_0.30.0_linux_arm64.zip"
    sha256 "4f41a61dcb8fb5db22b064331864746b9a5678ace05840daaa8c8bb033547c44"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
