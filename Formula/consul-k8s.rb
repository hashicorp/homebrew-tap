# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "2.0.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_darwin_amd64.zip"
    sha256 "281f6b4b73bcc05240a645b6e11bf579954fbfe58571b7daebfe241e8a4dbef2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_darwin_arm64.zip"
    sha256 "86e54668db0cf8204415e1314d487f6f45259b43b6d938e70450166a0f8628b5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_linux_amd64.zip"
    sha256 "60eeeb99b4337623a82c5197a86e31362b50a885496d8c55fd246e6dbe6994f0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_linux_arm.zip"
    sha256 "93f0a7dace3f219f5229bddbf0342ce51d30d9d51968bcd6fd30cf0238dd0c86"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.3/consul-k8s_2.0.3_linux_arm64.zip"
    sha256 "3f7c13796db4b168aaa3f2a791d4cfd1720868b52727fe626b74ebfbe7eaaddf"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"consul-k8s").write "complete -C #{opt_bin}/consul-k8s consul-k8s\n"
    (zsh_completion/"_consul-k8s").write <<~EOS
      #compdef consul-k8s
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/consul-k8s)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"consul-k8s.fish").write <<~EOS
      function __complete_consul-k8s
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/consul-k8s
      end
      complete -f -c consul-k8s -a "(__complete_consul-k8s)"
    EOS
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
