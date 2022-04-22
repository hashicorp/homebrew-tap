class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.10.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.1/vault_1.10.1_darwin_amd64.zip"
    sha256 "855c5f605f1cfb93408cc155d8a3fdf35a73b40a2f43a464fc11281306b07f29"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.10.1/vault_1.10.1_darwin_arm64.zip"
    sha256 "aaa3524da29b93fbb9d31c58b5274d7cb5e27cca0378fc64fb165267550c3092"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.1/vault_1.10.1_linux_amd64.zip"
    sha256 "a7f9a7508b3e1e4a904a2a2c3be512dd1ceb64a81eba81849ff84f47e8e41c94"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.1/vault_1.10.1_linux_arm.zip"
    sha256 "0006429adb8f06e0956ab7c47c59100f84b1abca82f3d14966d4c650455f3551"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.1/vault_1.10.1_linux_arm64.zip"
    sha256 "69cb2ef5b39769b9de1fc9d21712e16d79bada2ef3b1504b0a1fea45b4118b90"
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
