# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.11.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.4/waypoint_0.11.4_darwin_amd64.zip"
    sha256 "8942a7d00aaf0b39cec05e2f7da8788a2be0f2be0084236d228d031c6e56521f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.11.4/waypoint_0.11.4_darwin_arm64.zip"
    sha256 "c23da6fe2ba4db6f63963ef2e72caa71faae70b4f598d439d6f35d6abb79f557"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.4/waypoint_0.11.4_linux_amd64.zip"
    sha256 "96d314f1bc182a30ca9e93910981fbd4ecf7290763c55d2d4e8ddce2b23abdca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.4/waypoint_0.11.4_linux_arm.zip"
    sha256 "81f9cb034cd8107dc5972130e379559c384249fe068a00653fc11c3bbb98ca31"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.4/waypoint_0.11.4_linux_arm64.zip"
    sha256 "bbf331be8785a99a0bfcb4707a013355ba58516d0e9b1b78fd8808e4d2213e66"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"waypoint").write "complete -C #{opt_bin}/waypoint waypoint\n"
    (zsh_completion/"_waypoint").write <<~EOS
      #compdef waypoint
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/waypoint)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"waypoint.fish").write <<~EOS
      function __complete_waypoint
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/waypoint
      end
      complete -f -c waypoint -a "(__complete_waypoint)"
    EOS
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
