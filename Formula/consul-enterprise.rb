# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "2.0.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.4+ent/consul_2.0.4+ent_darwin_amd64.zip"
    sha256 "8184af77b05c614c10b58935de7b9aa9e4e774e8d2f6a161ef75ed089bf1a14e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.0.4+ent/consul_2.0.4+ent_darwin_arm64.zip"
    sha256 "15791a24b58c167e5c2957cdb019b90e75d2d3c4d0fe70fcebc0e0f7a732a14d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.4+ent/consul_2.0.4+ent_linux_amd64.zip"
    sha256 "ed024cafa7f78e88b7c9336ac9ca0a42bd414e310905960d610e6935ad01a0cc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.4+ent/consul_2.0.4+ent_linux_arm.zip"
    sha256 "8482c08f1c4c88d5b42528eef0ea929c8166103e2a902036923943ce3ec59816"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.4+ent/consul_2.0.4+ent_linux_arm64.zip"
    sha256 "fd060805ed685f7c6b7ed47bba73e4ed916ea3e2c0a203d63e0e5b5d045bb8a9"
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
