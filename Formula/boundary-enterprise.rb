# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "1.0.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.0.3+ent/boundary_1.0.3+ent_darwin_amd64.zip"
    sha256 "80cef8c7e63abd6f7db16bde560066ea60be48578183153c704934ebea4b8756"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/1.0.3+ent/boundary_1.0.3+ent_darwin_arm64.zip"
    sha256 "bdf6671d5d128e85e45042da684db160306b5ca8633d79800e1ff2fe221bb29b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/1.0.3+ent/boundary_1.0.3+ent_linux_amd64.zip"
    sha256 "8eb47d73b5adaa339a5b38035e5dacae069becae48e723898ee92f73b3474fe4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.0.3+ent/boundary_1.0.3+ent_linux_arm.zip"
    sha256 "bc20d3aab1830324b2bf92ce15cb69bc834107eb67da1c6f3d588f1b81cc1be4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/1.0.3+ent/boundary_1.0.3+ent_linux_arm64.zip"
    sha256 "6507b490b653fb66aa94fd47059e4715a06aec2f6814bcc7a18a1057458ccfcf"
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
