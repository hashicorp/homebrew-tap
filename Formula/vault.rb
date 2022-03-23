class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.0/vault_1.10.0_darwin_amd64.zip"
    sha256 "de25ae02c15fa8d0be2871a21c91b9e99495fe4f1c76b245fde300b7dd6a00ad"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.10.0/vault_1.10.0_darwin_arm64.zip"
    sha256 "320e7a6927afc611ec004758072c2b6dc053e216236fde0ee9e2a914b5e84db2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.0/vault_1.10.0_linux_amd64.zip"
    sha256 "ec06473d79e77c05700f051278c54b0f7b6f2df64f57f630a0690306323f1175"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.0/vault_1.10.0_linux_arm.zip"
    sha256 "342d450170f6396a9656c99205c4336b480fc0adb1e68b132d88abe5109fee29"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.0/vault_1.10.0_linux_arm64.zip"
    sha256 "e4f963616ed0c4a4a03d541fb531d692014357f2fb53b3c64e75dfe35b96d7be"
  end

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
