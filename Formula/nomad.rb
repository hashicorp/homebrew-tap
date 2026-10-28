# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "2.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.1.0/nomad_2.1.0_darwin_amd64.zip"
    sha256 "45ff4a7b7d7d7d186c78f63ea708ee27f455a03d4b6c33ddfc7d3e84610e0708"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.1.0/nomad_2.1.0_darwin_arm64.zip"
    sha256 "b3cb78d57d605138ec7889a240c8a34614ae229dbaa47d2656075d6a19917ceb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.1.0/nomad_2.1.0_linux_amd64.zip"
    sha256 "f7329569ccf047897ac905d05d557ca8eb5f8f28e1e7cbc2e7c73241e64c4f37"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.1.0/nomad_2.1.0_linux_arm64.zip"
    sha256 "f623ec1a096b95c3638ef81926f54f11aff4681bde2bbc2c467fbbdb861c0bd5"
  end

  conflicts_with "nomad"

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
