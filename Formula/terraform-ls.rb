# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.8/terraform-ls_0.38.8_darwin_amd64.zip"
    sha256 "34cfe6cbbb61da5b8fd21721e14be0f134417f249350872da1669454dc8762a4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.38.8/terraform-ls_0.38.8_darwin_arm64.zip"
    sha256 "510a506f7bf1550294202347261961e52daa4664a795e2deffbf7df7296b1f6c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.8/terraform-ls_0.38.8_linux_amd64.zip"
    sha256 "d16077d9c83f13ac33501af49ea75f43218d3fa2437c6c1374550b2625edc3ef"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.8/terraform-ls_0.38.8_linux_arm.zip"
    sha256 "ac77316f75dc79b87837347a755d2185e7fdfb48258143fb04b2047a472641d7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.8/terraform-ls_0.38.8_linux_arm64.zip"
    sha256 "762db754428dd188b949533ca05437955e26f4b3fc699d4b93392668a24e7a10"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
