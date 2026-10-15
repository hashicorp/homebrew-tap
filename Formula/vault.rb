# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "2.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.2.0/vault_2.2.0_darwin_amd64.zip"
    sha256 "39aff2c995dea611adc26c758402f8df2cd2e41c58c65892e49733b360aa45d4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.2.0/vault_2.2.0_darwin_arm64.zip"
    sha256 "7a442d1fff70045182f4c44427c050094cc05f034fed827ad3df7e1162d76230"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.2.0/vault_2.2.0_linux_amd64.zip"
    sha256 "05d78b0ac842ca7c522fc297df91527cd43c15420c4c5c0a969d48a7b0ff7b6d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.2.0/vault_2.2.0_linux_arm64.zip"
    sha256 "9d9ae0ce520744fb095bdf150a6924f5583528fd385a2e92782f7a6d00cad53c"
  end

  conflicts_with "vault"

  def install
    bin.install "vault"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"vault").write "complete -C #{opt_bin}/vault vault\n"
    (zsh_completion/"_vault").write <<~EOS
      #compdef vault
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/vault)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"vault.fish").write <<~EOS
      function __complete_vault
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/vault
      end
      complete -f -c vault -a "(__complete_vault)"
    EOS
  end

  service do
    run [bin/"vault", "server", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/vault.log"
    error_log_path var/"log/vault.log"
  end

  test do
    system "#{bin}/vault --version"
  end
end
