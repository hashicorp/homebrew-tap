# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.15.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_darwin_amd64.zip"
    sha256 "5a020a09b2dd7991f930596e751bdde51bba35b854912411e552782d4181618d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_darwin_arm64.zip"
    sha256 "262bab1c8776f97cc74ae02bb347bcc223bfdc44f83dc9190ea098b451d3ee65"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_linux_amd64.zip"
    sha256 "5e5f8c4a55567c37187de35c802eef2f04e9184c5a7bad64a914256b14701422"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_linux_arm.zip"
    sha256 "7bc00fb0f373d9d71a8fa447602339033ad51bd2abbf1d084669adb2e6b76ac7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_linux_arm64.zip"
    sha256 "e2594c265b08b00a33dfeb65221876b63a25d34e5d4d8cb1c8e33d54d71ab503"
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
