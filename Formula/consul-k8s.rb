# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "2.0.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.4/consul-k8s_2.0.4_darwin_amd64.zip"
    sha256 "df0da65b85df293f40635acf10997667035be75e10554dbc3b11c2022a0201b6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/2.0.4/consul-k8s_2.0.4_darwin_arm64.zip"
    sha256 "ee14f43815fc8bf26204d3494207c8062f7896cfc1d5a9f56dca7e5fd8ffe0a7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.4/consul-k8s_2.0.4_linux_amd64.zip"
    sha256 "a94528d21f8b6a33a1809d5ccb83ca7a72d6634df3a5cc2608ae9e33d9f81b1f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.4/consul-k8s_2.0.4_linux_arm.zip"
    sha256 "dfff8c475d125b85e46ee5a8ca4827d4a2f06547a286aa5193a5ca1fd8d75411"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.4/consul-k8s_2.0.4_linux_arm64.zip"
    sha256 "ae3e7be5820ebb35ccfc2d7f5508e9db1dccd46e8146d2ef812dcd71da51a0a9"
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
