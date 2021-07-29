class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.1.3"

  if OS.mac?
    url "https://releases.hashicorp.com/nomad/1.1.3/nomad_1.1.3_darwin_amd64.zip"
    sha256 "483edb14aa310d97209c3434b3fbc53032c21c6badfe8d9739dc643041fc7d98"
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
    url "https://releases.hashicorp.com/nomad/1.1.3/nomad_1.1.3_linux_amd64.zip"
    sha256 "e07ebf9ec81fb04ace94884d2c0b0e0bdee3510d5a203bcae96d8bee9463b418"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.1.3/nomad_1.1.3_linux_arm.zip"
    sha256 "e3e4c64409c95336e57c882d9bb7e253e6af8342e0d5154e2237ec54197e809b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.1.3/nomad_1.1.3_linux_arm64.zip"
    sha256 "97a725e3a4b5bcb76c3c67df96df4234ac43e37f9ad4027ebffb1c70905a2190"
  end

  bottle :unneeded

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  plist_options manual: "nomad agent -dev"

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
        <string>#{opt_bin}/nomad</string>
        <string>agent</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/nomad.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/nomad.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/nomad --version"
  end
end
