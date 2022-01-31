class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.3/vault_1.9.3_darwin_amd64.zip"
    sha256 "32614b830aae76cd42d6142cca86d6bc88d4951d505e2e2b39c2e03396e04e4c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.9.3/vault_1.9.3_darwin_arm64.zip"
    sha256 "36ee0bb83b29842100960fd6a89b826bea5d09d272f4bdeeddae11fcbbf2643e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.3/vault_1.9.3_linux_amd64.zip"
    sha256 "16059f245fb4df2800fe6ba320ea66aba9c2615348e37bcfd42754591a528639"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.3/vault_1.9.3_linux_arm.zip"
    sha256 "babbedfa3f134fbd68a4e1bb48e7302b9e40e8eae393f5f3688e295a7ea37f4f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.3/vault_1.9.3_linux_arm64.zip"
    sha256 "c420f14b8b712197c8c47852ea3d1a5976e9ceaf5bb8e6a0b311624111aa14d4"
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
