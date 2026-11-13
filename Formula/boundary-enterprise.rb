# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "1.1.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.1.1+ent/boundary_1.1.1+ent_darwin_amd64.zip"
    sha256 "af5731e1fd254ffa3bd568fc9b81156acb0d4719b1adcbd6a15bd47c06494364"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/1.1.1+ent/boundary_1.1.1+ent_darwin_arm64.zip"
    sha256 "95191534f531623d27e9fce1ef8704abc517ba33018a376aafd85a9002fae85d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.1.1+ent/boundary_1.1.1+ent_linux_amd64.zip"
    sha256 "3a4658982e0ca3cdb320c972a1510af16705345e8e0ff3d539e751a080db6916"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.1.1+ent/boundary_1.1.1+ent_linux_arm.zip"
    sha256 "59132093c808017356e3a8a9bef2026228d60fb59479b24c3c37dffb2c03dcea"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.1.1+ent/boundary_1.1.1+ent_linux_arm64.zip"
    sha256 "6ea3b372f1095113c553263236f85230c8eecc827d7426e380f693e150b6fc7b"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"boundary").write "complete -C #{opt_bin}/boundary boundary\n"
    (zsh_completion/"_boundary").write <<~EOS
      #compdef boundary
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/boundary)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"boundary.fish").write <<~EOS
      function __complete_boundary
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/boundary
      end
      complete -f -c boundary -a "(__complete_boundary)"
    EOS
  end

  test do
    system "#{bin}/boundary -version"
  end
end
