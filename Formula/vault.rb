class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.7.0"

  if OS.mac?
    url "https://releases.hashicorp.com/vault/1.7.0/vault_1.7.0_darwin_amd64.zip"
    sha256 "374fca0c8fcde45d5710e06673d03596371e92e18c33612396484758d2967d07"
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
    url "https://releases.hashicorp.com/vault/1.7.0/vault_1.7.0_linux_amd64.zip"
    sha256 "aad2f50635ef4e3f2495b0b6c855061c4047c795821fda886b326c1a71c71c35"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.7.0/vault_1.7.0_linux_arm.zip"
    sha256 "b92f2fe00bdcc7b0046075d6132eca83123c11b286a8ca4897e4fb6008bf063c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.7.0/vault_1.7.0_linux_arm64.zip"
    sha256 "ef5fd091c40452e4cd5c855de6cc85a6c9654790e707b342a0cb9fef48d80d2a"
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
