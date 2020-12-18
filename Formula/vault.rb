class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"

  url "https://releases.hashicorp.com/vault/1.6.1/vault_1.6.1_darwin_amd64.zip"
  version "1.6.1"
  sha256 "2a59b5fe368fde62de81556db2cdc852d9b66a7651cf51333342791115e7da6a"
  bottle :unneeded

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  plist_options manual: "vault server -dev"

  def plist
    <<~EOS
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
