class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.12.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.1/vault_1.12.1_darwin_amd64.zip"
    sha256 "e7a87416d6086aa7910ed09b191ec584c9c984cb04cb74b75bedf80ddb050702"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.12.1/vault_1.12.1_darwin_arm64.zip"
    sha256 "9c1f28bdd8571deb35406d03b37388a419a082cb1a63c43760886abfb3c7bfb5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.1/vault_1.12.1_linux_amd64.zip"
    sha256 "839fa81eacd250e0b0298e518751a792cd5d7194650af78cf5da74d7b7b1e5fb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.1/vault_1.12.1_linux_arm.zip"
    sha256 "9ff85110c239c1f97873cb731c2bdaca7fb6df57828d03c7d8814e13f9c3a7a3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.1/vault_1.12.1_linux_arm64.zip"
    sha256 "f583cdd21ed1fdc99ec50f5400e79ebc723ed3ce92d2d1d42490cff9143ed693"
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
