# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.16.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.2/terraform_1.16.2_darwin_amd64.zip"
    sha256 "275f50ed172af2f23e15a2ce7e3251aac8b17b768f2e62eceb81c353cd106abf"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.16.2/terraform_1.16.2_darwin_arm64.zip"
    sha256 "7c0a0b31c8aa541351369bcf7b62a7289fbc21de7e577669aeba6d42f4e6cc41"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.2/terraform_1.16.2_linux_amd64.zip"
    sha256 "0d17011f0c4664539b164b044903d04e296c86c13cb9f28040076c65cfb3985a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.2/terraform_1.16.2_linux_arm.zip"
    sha256 "456d3fc4b2d3b04509cdc0bd1f00fe4535d2c4c8c74e7da729864bc75b67335b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.2/terraform_1.16.2_linux_arm64.zip"
    sha256 "c040bd1e3122b4290f70f74288d8c5a54ddd4254a3e52a29e7cc666653f50a0a"
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
