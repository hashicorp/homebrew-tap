# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "2.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.1.0/consul_2.1.0_darwin_amd64.zip"
    sha256 "40e614b6bf47e85387c7a9f65b97e4f0a6f21057c4e50e1b05cbc4691b338d99"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.1.0/consul_2.1.0_darwin_arm64.zip"
    sha256 "236d6a579c5fcfb065f416bd3a296ad199a1116c2667481bffdfdc60a5e61468"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.1.0/consul_2.1.0_linux_amd64.zip"
    sha256 "a9c9cdf1ed93bd29a9671b02e5433131f3f777bab16c076fcef712a2820bfe33"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.1.0/consul_2.1.0_linux_arm.zip"
    sha256 "6bea91aca838972fe709554787bccbefc8913948456dbec90a9db32dc72b679c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.1.0/consul_2.1.0_linux_arm64.zip"
    sha256 "eb34b81592e25eadb3fbc553afb2036004dcd316d99a1a8e40a177fde4e0e537"
  end

  conflicts_with "consul"

  def install
    bin.install "consul"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"consul").write "complete -C #{opt_bin}/consul consul\n"
    (zsh_completion/"_consul").write <<~EOS
      #compdef consul
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/consul)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"consul.fish").write <<~EOS
      function __complete_consul
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/consul
      end
      complete -f -c consul -a "(__complete_consul)"
    EOS
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end

  test do
    system "#{bin}/consul --version"
  end
end
