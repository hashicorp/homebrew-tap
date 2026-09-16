# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "2.1.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.1+ent/vault_2.1.1+ent_darwin_amd64.zip"
    sha256 "bbb39f3109ddf788f131de7e578f9a3ddb961405cfa54e62e77f736f4f78ad99"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.1.1+ent/vault_2.1.1+ent_darwin_arm64.zip"
    sha256 "22049faeb8c9c15aea12246602f5d36863ad9ef66eca8d17fd093ddb22f3f743"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.1+ent/vault_2.1.1+ent_linux_amd64.zip"
    sha256 "10ff6e66ef6f69b7893af48896614eb9288bbab0f1ce74754fc9d3309f29f66f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.1.1+ent/vault_2.1.1+ent_linux_arm64.zip"
    sha256 "652982e6984ba4408345fc2f9c55dd2c3d47b56948ef1d9ca65116ad83e0a7cf"
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
