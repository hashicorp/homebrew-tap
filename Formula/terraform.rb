# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.16.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.5/terraform_1.16.5_darwin_amd64.zip"
    sha256 "9809158e481cf2d3a8433e59179f397b8edb5172397711bd98f6bb32edcaf53b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.16.5/terraform_1.16.5_darwin_arm64.zip"
    sha256 "ecdef65e24193d627f27c39baeda31295f08c938d8a3d4764f442fb916d4b7dc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.5/terraform_1.16.5_linux_amd64.zip"
    sha256 "2bc2fcfff033265c9e02ca0351f01794eb122f62a9b2a49a3294b9e49eaab5e4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.5/terraform_1.16.5_linux_arm.zip"
    sha256 "e69839d7c3e8d7d1c49e78a1ca6902e95818a14179dad8732b13171bbc60809e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.5/terraform_1.16.5_linux_arm64.zip"
    sha256 "61a50b00485ee4810cf20581ef080fc54d34d666e175c58d9a10501c65c1ccde"
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
