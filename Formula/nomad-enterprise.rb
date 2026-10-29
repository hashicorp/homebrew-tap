# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.1.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.1.1+ent/nomad_2.1.1+ent_darwin_amd64.zip"
    sha256 "4191ce5bfabc5f31286c20adbd2340cbe17b1e5e9aab7ccaa463f69c122ebd18"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.1.1+ent/nomad_2.1.1+ent_darwin_arm64.zip"
    sha256 "1b67f6a2a2af2f4d1df70581b47f9cc6663c8d57505022da769e2216dd926155"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.1.1+ent/nomad_2.1.1+ent_linux_amd64.zip"
    sha256 "249756a45b745f9d28d26fd995c068055e224833ff819c014859bf4d5b83d9d8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.1.1+ent/nomad_2.1.1+ent_linux_arm64.zip"
    sha256 "6f40e495f46a914d232c7bc25653b0f159d9fc07eb3a6a008d4ec0cb9ce01488"
  end

  conflicts_with "nomad-enterprise"

  def install
    bin.install "nomad"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"nomad").write "complete -C #{opt_bin}/nomad nomad\n"
    (zsh_completion/"_nomad").write <<~EOS
      #compdef nomad
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/nomad)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"nomad.fish").write <<~EOS
      function __complete_nomad
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/nomad
      end
      complete -f -c nomad -a "(__complete_nomad)"
    EOS
  end

  service do
    run [bin/"nomad", "agent", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/nomad.log"
    error_log_path var/"log/nomad.log"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
