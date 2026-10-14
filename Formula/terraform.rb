# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.16.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.6/terraform_1.16.6_darwin_amd64.zip"
    sha256 "794a36c3f7ebf6c58f2089c226068a539d1705ba358a5679b51671c8dc7ebc7b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.16.6/terraform_1.16.6_darwin_arm64.zip"
    sha256 "85e1bc78ab45bdc5f82a7bac3929e37d072834a584d22583a2498dc67bb624cd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.6/terraform_1.16.6_linux_amd64.zip"
    sha256 "38034b38d03096399a7a1264a14561a8029b2b496fd1f169452656e53968f1b7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.6/terraform_1.16.6_linux_arm.zip"
    sha256 "d86a3f37fc60fd8d173d3c966957d8a0fa7c8ee131ee9ec100be8d06733c7728"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.6/terraform_1.16.6_linux_arm64.zip"
    sha256 "a750b5a11038f165846b2658c40c88cd7070aa67a61bab431a14ba27928ea9ea"
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
