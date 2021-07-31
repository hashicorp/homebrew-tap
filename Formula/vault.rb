class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.8.0"

  if OS.mac?
    url "https://releases.hashicorp.com/vault/1.8.0/vault_1.8.0_darwin_amd64.zip"
    sha256 "b9b1b80cba165a6dae8c5bbf6207f1c94f669ee64fdec5c2c21ee0fa4c06147f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.8.0/vault_1.8.0_darwin_arm64.zip"
    sha256 "b057d5314f66609510975236d7ed62825151a45d1dfa079f611d2302fa62b483"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.0/vault_1.8.0_linux_amd64.zip"
    sha256 "1fe90f0c4f31baeda580435fe2dfaf09bf939e2f8286407c2b9644808637272a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.0/vault_1.8.0_linux_arm.zip"
    sha256 "4baf2fe4a3cff83f23968c17a6322546c15ca4b379dc0faa69ff2dbd6aecd662"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.0/vault_1.8.0_linux_arm64.zip"
    sha256 "acba3e6a5f85e2d341c672c71130c367835cc44f76fdb2566732226cd57c53aa"
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
