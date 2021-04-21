class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.7.1"

  if OS.mac?
    url "https://releases.hashicorp.com/vault/1.7.1/vault_1.7.1_darwin_amd64.zip"
    sha256 "f08f61231a31875334204ac94e726cf032e284ee95b096ab475b3699b9fb3f90"
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
    url "https://releases.hashicorp.com/vault/1.7.1/vault_1.7.1_linux_amd64.zip"
    sha256 "61795d2deeffddee0b556869097c997c5afccbde556d3a103ec273cc24523808"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.7.1/vault_1.7.1_linux_arm.zip"
    sha256 "f334e35a6897513f94dae056c5609d8837e512378659cfb262b5a5982376437b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.7.1/vault_1.7.1_linux_arm64.zip"
    sha256 "58dd1744979c3461e92d5f3e02d94056446286e555cc96888c627d837cad99de"
  end

  bottle :unneeded

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  plist_options manual: "vault server -dev"

  def plist; <<~EOS
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{opt_bin}/vault</string>
        <string>server</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/vault.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/vault.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/vault --version"
  end
end
