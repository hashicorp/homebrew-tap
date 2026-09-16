# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.16.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_darwin_amd64.zip"
    sha256 "1b933c61782390531374290309ada8406cd923647893c2f52b5dd838de23803a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_darwin_arm64.zip"
    sha256 "c2c45425ea4568da9803e127e589186cb3798a5944d9aff5a5bc15dd18267560"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_linux_amd64.zip"
    sha256 "093b6ae9a2228af5029c41606bc96eb583553528aad1bfe7e0b4d62fc91e25d8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_linux_arm.zip"
    sha256 "2f50d88b99d7c0145cc1cf51adf92c46cbff6f211a7539c44bf3319baa50bb5f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.3/terraform_1.16.3_linux_arm64.zip"
    sha256 "b6b293550af7a6a7ffd867a04900ce161db86ec9407b234a636c2adbae2ca9f0"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"terraform").write "complete -C #{opt_bin}/terraform terraform\n"
    (zsh_completion/"_terraform").write <<~EOS
      #compdef terraform
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/terraform)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"terraform.fish").write <<~EOS
      function __complete_terraform
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/terraform
      end
      complete -f -c terraform -a "(__complete_terraform)"
    EOS
  end

  test do
    system "#{bin}/terraform --version"
  end
end
