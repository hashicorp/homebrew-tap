# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "2.2.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.2.2/vault_2.2.2_darwin_amd64.zip"
    sha256 "57ce53e10b266d2c1c2c3646813e434777e9bddb4e5377e7e1250e85ca98a2f9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.2.2/vault_2.2.2_darwin_arm64.zip"
    sha256 "75843ff0559dfa4d69bfde073f98caaa22674c27fd80446d092ad2069d7f25f8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.2.2/vault_2.2.2_linux_amd64.zip"
    sha256 "5700edf139113609962fe371af7d2a53de8ecb720d545dc39b43de204515d3c4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.2.2/vault_2.2.2_linux_arm64.zip"
    sha256 "78634c8672601ad1ca9b27f24e76c54224d12521c59ece957ab8d23976ddca12"
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
