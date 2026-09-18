# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.16.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.16.1/packer_1.16.1_darwin_amd64.zip"
    sha256 "e3655fb154e718526c3bcaacf327e6247e55945d2fefd59f84f535750f7ef5c4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.16.1/packer_1.16.1_darwin_arm64.zip"
    sha256 "c45cb1f851971e8a340c4a36434273cf2c8ef0cc7f5b3ac65588a3539b1df424"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.16.1/packer_1.16.1_linux_amd64.zip"
    sha256 "af38a9e93e4ed1b9ca68206ae969c64c300c82a3dde46a780dfa629f0867f651"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.16.1/packer_1.16.1_linux_arm.zip"
    sha256 "dfb61912e59912f7d559a1f2b7bdf9fad702ae0a86226d87a8cee04a981a08b7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.16.1/packer_1.16.1_linux_arm64.zip"
    sha256 "4784ac0b9228a61f3ecb3861dbf0bf9ebeab6ddb0f5a10466126b8daa5db0de5"
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
