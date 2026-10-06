# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "2.1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.1/vault_2.1.1_darwin_amd64.zip"
    sha256 "1310ccba498a08fa9bfe09c698f54f38b6d9c2ae45bae08cf91f02bc10d295b6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.1.1/vault_2.1.1_darwin_arm64.zip"
    sha256 "95d100472b726d889ee380c9335191abdf5b3e6f3108cde48f4f962bfea4f009"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.1/vault_2.1.1_linux_amd64.zip"
    sha256 "8aa90f9cea46f541fc7baa3d0ec692fc06afde9a248cc1f2dcac46a567c6f56b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.1.1/vault_2.1.1_linux_arm64.zip"
    sha256 "c2c74e111ffbc83b3d29c6f0c0215a5e53d738c9fad045f7797bcdcde3156067"
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
