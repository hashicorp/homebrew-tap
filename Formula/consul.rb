# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "2.0.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.4/consul_2.0.4_darwin_amd64.zip"
    sha256 "d8c1456641dd5cb9e453bfb054e44abd8152d4e13113cd6e2093cb99b4804845"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.0.4/consul_2.0.4_darwin_arm64.zip"
    sha256 "1f51416d27cf5404106e6b2d24de60d4a3677d1a99045e38986f0cc23cb78303"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.4/consul_2.0.4_linux_amd64.zip"
    sha256 "7a28033850a24fd411722593931625d8b548a27646c3ab70c1379ea7fd2af423"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.4/consul_2.0.4_linux_arm.zip"
    sha256 "bcfd998627f01e683880b9eeaf77762bb2fc1ef9588ab6c23328cebd727e2b57"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.4/consul_2.0.4_linux_arm64.zip"
    sha256 "8530dd2f92c1f4acddf152a96e2629a89e6f0f19229889d20dbf8092927aa742"
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
