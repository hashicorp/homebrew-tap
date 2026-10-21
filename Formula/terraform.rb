# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.17.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.17.0/terraform_1.17.0_darwin_amd64.zip"
    sha256 "3773397524196e4ebbf7167e2b9fb478dff1962d555d649f616ba97ca446a143"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.17.0/terraform_1.17.0_darwin_arm64.zip"
    sha256 "7472a54cca911d46c0e399a5ebbce44444912d0d4dad7495f37f1fa51e7ca6b7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.17.0/terraform_1.17.0_linux_amd64.zip"
    sha256 "c168cab7c637a8769fdb90089ddd19de701bc6ff8aca64dc2e2185fe46f59f67"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.17.0/terraform_1.17.0_linux_arm.zip"
    sha256 "6afa19b6b59648160fb011f29994960efca87cba7cac3e5a86ca8df7be13019d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.17.0/terraform_1.17.0_linux_arm64.zip"
    sha256 "f32478134ffc6d710eec474bbd316652cdddc0f4e336973a3745e8d3a3309cdf"
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
