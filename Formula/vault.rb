# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "2.1.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.2/vault_2.1.2_darwin_amd64.zip"
    sha256 "8a057a4e005113223f2d479a13ff6d9a781e9145db0327270c94d3ff14ed2af7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.1.2/vault_2.1.2_darwin_arm64.zip"
    sha256 "bdd5a4b5d4b5afe7a79ce629e41ddca6480068df8fe1d74665e681b27abd8001"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.2/vault_2.1.2_linux_amd64.zip"
    sha256 "873bbdac35ca4b0c3e2886c41991ca1272fc452826208d5499f32d12cd2e76e1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.1.2/vault_2.1.2_linux_arm64.zip"
    sha256 "57c0c4d2f8c1694b18f26f922eca40e472355934dca2f3bd63f415042d1898ed"
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
