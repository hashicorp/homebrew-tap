# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.16.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.4/terraform_1.16.4_darwin_amd64.zip"
    sha256 "2ee4b62064086e4b24b0d6cf2e61718fbaf0556feba990f708a5e32557554b3b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.16.4/terraform_1.16.4_darwin_arm64.zip"
    sha256 "42cfdf97ad722f79085fe2279b06d4b8680172de3534b22eeddd9a0fbbe7b8f1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.4/terraform_1.16.4_linux_amd64.zip"
    sha256 "dc94af0eef1147718ad7c8daea792ed199e3e0492eec180d0adafa2a65a879df"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.4/terraform_1.16.4_linux_arm.zip"
    sha256 "94f9b3fc5f8b9d01392ffb5347af0bad5f6a79bcfdba61936b49279eef60840f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.4/terraform_1.16.4_linux_arm64.zip"
    sha256 "8263f301cb1a24489a4adeed147bf28504053f77237b3ea97a0ef2972659de30"
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
