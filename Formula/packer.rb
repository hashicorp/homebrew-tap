# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.16.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.16.3/packer_1.16.3_darwin_amd64.zip"
    sha256 "b524e8aba9083ecc1945a9c1de28846e141caad36dca8ee6700b24d3bac580b3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.16.3/packer_1.16.3_darwin_arm64.zip"
    sha256 "ff6184d8c9c633c177d6b6e96965cf735fdfb797d9401d14ab0d7644850a2e08"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.16.3/packer_1.16.3_linux_amd64.zip"
    sha256 "9d625866a239583652e6ea210234abfd6416a27459cd482e5a03a845b9726d6c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.16.3/packer_1.16.3_linux_arm.zip"
    sha256 "99c93e1038dcef631f237451e1be9586312d62567ff5988fc98f0c0f0a5b9b88"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.16.3/packer_1.16.3_linux_arm64.zip"
    sha256 "47f27ba2f2b313fc259e549d6bf9512b8f2a10fda9fdf4abd6aff8f267e7a032"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"packer").write "complete -C #{opt_bin}/packer packer\n"
    (zsh_completion/"_packer").write <<~EOS
      #compdef packer
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/packer)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"packer.fish").write <<~EOS
      function __complete_packer
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/packer
      end
      complete -f -c packer -a "(__complete_packer)"
    EOS
  end

  test do
    system "#{bin}/packer --version"
  end
end
