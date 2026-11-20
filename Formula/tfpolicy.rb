# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Tfpolicy < Formula
  desc "Terraform Policy"
  homepage "https://developer.hashicorp.com/terraform/policy/reference/cli"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfpolicy/0.5.0/tfpolicy_0.5.0_darwin_amd64.zip"
    sha256 "07f520a7e9229d067f832f74ac63d4f439d4c1effe9dd8fe3deade18c3c434f9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfpolicy/0.5.0/tfpolicy_0.5.0_darwin_arm64.zip"
    sha256 "055f5a83cb3ad82a966062f442acb74d4588143678b9fcc3aa2da24f17d989c8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfpolicy/0.5.0/tfpolicy_0.5.0_linux_amd64.zip"
    sha256 "bee5d7e83e196c853bbb7eb46b39a0646d6b044eb1b6dc1fdfaf3a9c9eb6f6df"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfpolicy/0.5.0/tfpolicy_0.5.0_linux_arm.zip"
    sha256 "437e0f21c7e417b5c657f2a5741441ea2d51af56da44a8bd304b5e0123e1457c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfpolicy/0.5.0/tfpolicy_0.5.0_linux_arm64.zip"
    sha256 "dff844259f41a9d72c55fbad1a55fe45569d405c71aaa694d6e428595a52a902"
  end

  conflicts_with "tfpolicy"

  def install
    bin.install "tfpolicy"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"tfpolicy").write "complete -C #{opt_bin}/tfpolicy tfpolicy\n"
    (zsh_completion/"_tfpolicy").write <<~EOS
      #compdef tfpolicy
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/tfpolicy)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"tfpolicy.fish").write <<~EOS
      function __complete_tfpolicy
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/tfpolicy
      end
      complete -f -c tfpolicy -a "(__complete_tfpolicy)"
    EOS
  end

  test do
    system "#{bin}/tfpolicy --version"
  end
end
