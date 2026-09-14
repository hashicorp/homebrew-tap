# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.21.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_darwin_amd64.zip"
    sha256 "d349e100b3f951caca9ed46a509458a0f5a265e7c6a8c0fca612d922a9e15af4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_darwin_arm64.zip"
    sha256 "7d64c6bf6ca437b10a143d47bb85cfaff0af7ba83c598a38b1ac275d2acc75c1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_linux_amd64.zip"
    sha256 "1a948c143b849cedba91127aa11155c6006d84051282a0d93f3d89525b460d12"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_linux_arm.zip"
    sha256 "382e5df3f0a6961bec4711e09f443d199255ba88afdf8db4bd19bbdde5ed6349"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.3/boundary_0.21.3_linux_arm64.zip"
    sha256 "7b023a78f3ba4c100d665daf9a93861785396a40b7d3e5878c1e86b48d24b966"
  end

  conflicts_with "boundary"

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
