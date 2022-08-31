class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.11.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.3/vault_1.11.3_darwin_amd64.zip"
    sha256 "1579d3ab5401778d8c1605c6581225ade614fa6d8094ddf8ff2e2e84c2457c2a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.11.3/vault_1.11.3_darwin_arm64.zip"
    sha256 "78f1401359fc6b9b2e4c7d7d8bea0c85651145ebe900a20ece6723d236c3a9e0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.3/vault_1.11.3_linux_amd64.zip"
    sha256 "b433413ce524f26abe6292f7fc95f267e809daeacdf7ba92b68dead322f92deb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.3/vault_1.11.3_linux_arm.zip"
    sha256 "01beb03da41b02e44553e4a55eee95914942fa56844ae15625374126baed7cb8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.3/vault_1.11.3_linux_arm64.zip"
    sha256 "5ccf49bd3601e29d6d1a8c321ece1eacf0f7cc12ea604ac392edd4f7a54d69c4"
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
