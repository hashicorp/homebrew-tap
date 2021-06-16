class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.7.3"

  if OS.mac?
    url "https://releases.hashicorp.com/vault/1.7.3/vault_1.7.3_darwin_amd64.zip"
    sha256 "36cf1ae3c0b011f54d7a4dfb97e0f1afd8dc3de41a19f338b54dab256133856b"
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
    url "https://releases.hashicorp.com/vault/1.7.3/vault_1.7.3_linux_amd64.zip"
    sha256 "8453132a93b755c0a89dd4b2f1a99bd4af06f8167b81917f117080839031e03f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.7.3/vault_1.7.3_linux_arm.zip"
    sha256 "fe898b477161b0152c0b0f2ad62a458e7a98b25d8f35ed1efcf947dc7b05a57e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.7.3/vault_1.7.3_linux_arm64.zip"
    sha256 "23092f60d8bc96b5c40cec71fec933e76e14afb952c5cd1b8d58354590015c30"
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
