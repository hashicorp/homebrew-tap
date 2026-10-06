# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.9.2"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.9.2/consul-terraform-sync_0.9.2_darwin_amd64.zip"
    sha256 "84e923ad4764c50811263cbcba07c1d6a03fcba073442ffe0005d5019e61fbcd"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.9.2/consul-terraform-sync_0.9.2_linux_amd64.zip"
    sha256 "dcb87be8dac18c71e42680a8dabfc3d9013c99d3fe033dec1bf717f28c92e999"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.9.2/consul-terraform-sync_0.9.2_linux_arm.zip"
    sha256 "6389955b9fed74c0bbab8d92492594fe23d7666233799c904299e6374be9082d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.9.2/consul-terraform-sync_0.9.2_linux_arm64.zip"
    sha256 "d2bbcf3451eef9177bda22c8f8c63b82c23b649d5e2a15e3362a692f141d9605"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"consul-terraform-sync").write "complete -C #{opt_bin}/consul-terraform-sync consul-terraform-sync\n"
    (zsh_completion/"_consul-terraform-sync").write <<~EOS
      #compdef consul-terraform-sync
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/consul-terraform-sync)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"consul-terraform-sync.fish").write <<~EOS
      function __complete_consul-terraform-sync
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/consul-terraform-sync
      end
      complete -f -c consul-terraform-sync -a "(__complete_consul-terraform-sync)"
    EOS
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
