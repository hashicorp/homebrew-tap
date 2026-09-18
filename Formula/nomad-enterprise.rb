# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.0.7+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.7+ent/nomad_2.0.7+ent_darwin_amd64.zip"
    sha256 "0630acc5868b40c96460dd2a39a17292e7f214ffb6df492e0e070260f3d8b090"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.7+ent/nomad_2.0.7+ent_darwin_arm64.zip"
    sha256 "7d9e5e2a2ef8fd3061d962b467b133e7beb691a65c9ab3365cb19324a1e9567a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.7+ent/nomad_2.0.7+ent_linux_amd64.zip"
    sha256 "bbd34946a470ad222d646427d9a927ed5533ecf5760b33b60a1f2d4702b52d1b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.7+ent/nomad_2.0.7+ent_linux_arm64.zip"
    sha256 "b34c1ea7b3a8b2f54e3217668e354c53dbf5a5abb348fbf229309fccb9553424"
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
