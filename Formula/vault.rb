class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.7.2"

  if OS.mac?
    url "https://releases.hashicorp.com/vault/1.7.2/vault_1.7.2_darwin_amd64.zip"
    sha256 "7d37e12ccb9497a9e403d562d837b2ea7b99dbe919e6956ade1e2e410a54f573"
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
    url "https://releases.hashicorp.com/vault/1.7.2/vault_1.7.2_linux_amd64.zip"
    sha256 "5ee6bb8119b55c27cd3864c982177714a0a4a3813927ccafdb262e78e4bb67bc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.7.2/vault_1.7.2_linux_arm.zip"
    sha256 "38782995fecb298f4a6c55e5568a7ea54a8516a7ea4ebaf25bb7caf0f6111c4a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.7.2/vault_1.7.2_linux_arm64.zip"
    sha256 "2bb9d49b253893ffa2149ee85ce2f2bc72360a2c14ac8775155f34c572344533"
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
