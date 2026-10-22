# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.16.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.16.2/packer_1.16.2_darwin_amd64.zip"
    sha256 "cca17e6889754c8f6e9d9a2646a9f9cc650a70dfdafc8e7da7e5279977b7d812"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.16.2/packer_1.16.2_darwin_arm64.zip"
    sha256 "3d7e4df8e7e8c21bdf495c4f63ad9189e22540dc8126dee6db791aa8519e8b3a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.16.2/packer_1.16.2_linux_amd64.zip"
    sha256 "abbfe0cf74985084112659b53e3565f264f70a20914c3b7c4f789f54f61c2414"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.16.2/packer_1.16.2_linux_arm.zip"
    sha256 "5985e8a757d3814b5eddb9b9c93b45a2e48bf1e509925a0e43030c17d55c201a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.16.2/packer_1.16.2_linux_arm64.zip"
    sha256 "5d7d6de86a49b2d64f3c0eef5766855b580e10a7c45bd6605ba8f1dead7815ea"
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
