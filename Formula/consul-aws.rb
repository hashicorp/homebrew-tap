# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulAws < Formula
  desc "Consul AWS"
  homepage "https://github.com/hashicorp/consul-aws"
  version "0.1.3"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-aws/0.1.3/consul-aws_0.1.3_darwin_amd64.zip"
    sha256 "41c57011b30233ae972428f2e57f11ee656138b116982bbcb6bf5a3e138e7510"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-aws/0.1.3/consul-aws_0.1.3_linux_amd64.zip"
    sha256 "041d14c0219b13f109745bc97818fd235afde2badff6264d9132438d0a03fdf0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-aws/0.1.3/consul-aws_0.1.3_linux_arm64.zip"
    sha256 "a6a2c3e9e480da2c57da7cfbfc7bfadfcc8a2df654fc3fc92330f255fae497a8"
  end

  conflicts_with "consul-aws"

  def install
    bin.install "consul-aws"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"consul-aws").write "complete -C #{opt_bin}/consul-aws consul-aws\n"
    (zsh_completion/"_consul-aws").write <<~EOS
      #compdef consul-aws
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/consul-aws)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"consul-aws.fish").write <<~EOS
      function __complete_consul-aws
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/consul-aws
      end
      complete -f -c consul-aws -a "(__complete_consul-aws)"
    EOS
  end

  test do
    system "#{bin}/consul-aws --version"
  end
end
