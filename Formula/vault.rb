class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.8.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.5/vault_1.8.5_darwin_amd64.zip"
    sha256 "3f70876616b289eaed6dbdd93333481cec2b8c19c80515bfff4e3dd816cd8a70"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.8.5/vault_1.8.5_darwin_arm64.zip"
    sha256 "3f3e90d39d46e51c3ff40c63d629d00af4025db7b7313faccbb88159d5cca469"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.5/vault_1.8.5_linux_amd64.zip"
    sha256 "97d7ac9145ffdf256ab91045a4857a640ecaa7c56bbd66b61fb70990620f3d33"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.5/vault_1.8.5_linux_arm.zip"
    sha256 "7cb8a2611abf962e25bc6ba943bc80e48d242d02edb718c0b3fb86c47c28a410"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.5/vault_1.8.5_linux_arm64.zip"
    sha256 "a1a57c51505cce0857c32a159ed193dd330e43bee1f3340d2143993c64cf0645"
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
