# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.10.0/hc-install_0.10.0_darwin_amd64.zip"
    sha256 "90946d0b0c50646e8fd280201cf7011ea71ac8a3d1e28d390d65ed9a1849b421"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.10.0/hc-install_0.10.0_darwin_arm64.zip"
    sha256 "1d90bcb56c2a5cae548a86ad2a7be6bbd66c9f754c3bd18f782c08883609ef89"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.10.0/hc-install_0.10.0_linux_amd64.zip"
    sha256 "f56c3c52490002ab1d37867508fb73a66bf7727b2590fe47978b18c9026801d7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.10.0/hc-install_0.10.0_linux_arm.zip"
    sha256 "bf3b866eebcf8c6d58218afffa48341818cd10c11ee05c9f41d959c6d29c40a7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.10.0/hc-install_0.10.0_linux_arm64.zip"
    sha256 "e59a95ea7b483cfe680d8a97deb194c5e21d69f2e9c9568bf41749828cb92fa1"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"

    # The binary completes itself when invoked with COMP_LINE set, rather than
    # emitting a script, so these mirror what -autocomplete-install writes to rc files.
    (bash_completion/"hc-install").write "complete -C #{opt_bin}/hc-install hc-install\n"
    (zsh_completion/"_hc-install").write <<~EOS
      #compdef hc-install
      local -a matches
      matches=( ${(f)"$(COMP_LINE="$words" COMP_POINT=$(( 1 + ${#${(j. .)words[1,CURRENT-1]}} + $#PREFIX )) #{opt_bin}/hc-install)"} )
      compadd -Q -S '' -a matches
    EOS
    (fish_completion/"hc-install.fish").write <<~EOS
      function __complete_hc-install
          set -lx COMP_LINE (commandline -cp)
          test -z (commandline -ct)
          and set COMP_LINE "$COMP_LINE "
          #{opt_bin}/hc-install
      end
      complete -f -c hc-install -a "(__complete_hc-install)"
    EOS
  end

  test do
    system "#{bin}/hc-install --version"
  end
end
