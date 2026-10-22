# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "2.1.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.1.0+ent/consul_2.1.0+ent_darwin_amd64.zip"
    sha256 "131df7a314a6e266d8286d9141d5f7d8717746b2aa24dafa3ac3c7397bcb357a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.1.0+ent/consul_2.1.0+ent_darwin_arm64.zip"
    sha256 "911fed82485cddc2a25c8212988e8469bd746220254285033c2e4fc26f36ee09"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.1.0+ent/consul_2.1.0+ent_linux_amd64.zip"
    sha256 "30f484b5e97b042f41196698e460915806e4b2b35ab1c7efb7a6a875479868d4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.1.0+ent/consul_2.1.0+ent_linux_arm.zip"
    sha256 "9831466387c704885d419bef31b9b11d334b85bc3e03000ca83cc46a2c3abb4d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.1.0+ent/consul_2.1.0+ent_linux_arm64.zip"
    sha256 "96ab1596780fa592c064dc93c4fb3260ba2a717f1b6f3b4660340048dd26b646"
  end

  conflicts_with "consul-enterprise"

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
