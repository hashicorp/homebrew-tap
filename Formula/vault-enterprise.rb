# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "2.2.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.2.2+ent/vault_2.2.2+ent_darwin_amd64.zip"
    sha256 "bdb333de9768b9002b1726f0747799e4e6c7100349974fd279f467ba7ee7d94b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.2.2+ent/vault_2.2.2+ent_darwin_arm64.zip"
    sha256 "5aec68de3739616da9109493006292526fd701c8aa4617c7d710c068b333bb90"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.2.2+ent/vault_2.2.2+ent_linux_amd64.zip"
    sha256 "23199c7d6d15789507d91890116d2e5c2d7495dd82fe4d9572954b2b50cedfbd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.2.2+ent/vault_2.2.2+ent_linux_arm64.zip"
    sha256 "bc1291499867d1385c0145ea8ec560b8f1eb6e02698162bf214ca22de7ed0237"
  end

  conflicts_with "vault-enterprise"

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
