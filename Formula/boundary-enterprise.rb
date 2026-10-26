# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "1.1.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.1.0+ent/boundary_1.1.0+ent_darwin_amd64.zip"
    sha256 "102672d4ef4c7dddc37f72cf48350d2da9e49365a3d428c2a2b17a58e485daec"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/1.1.0+ent/boundary_1.1.0+ent_darwin_arm64.zip"
    sha256 "babe55c80e22f63423e0d61c79713e7e6c58e766557b2181ccadea0bbcf796b0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.1.0+ent/boundary_1.1.0+ent_linux_amd64.zip"
    sha256 "919bb79949f701192e75bde512f98fc0c956a5df2e5b87bf443da2af6c524a59"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.1.0+ent/boundary_1.1.0+ent_linux_arm.zip"
    sha256 "d494f31f2ade8e1dd65cc3c51492ba34b4c9d74a964237ba9782b6dbdcbaaeb5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.1.0+ent/boundary_1.1.0+ent_linux_arm64.zip"
    sha256 "bcdecb2683c0c60db40867e9459821bbc6bed4084fb3e096ac6b5ef97df78d14"
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
