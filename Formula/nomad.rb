class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.0.5"

  if OS.mac?
    url "https://releases.hashicorp.com/nomad/1.0.5/nomad_1.0.5_darwin_amd64.zip"
    sha256 "02f1a9e3c9f3e205cfac483c04f0d1de6459e8820823d2934723f05da0646886"
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
    url "https://releases.hashicorp.com/nomad/1.0.5/nomad_1.0.5_linux_amd64.zip"
    sha256 "00b8f71adec54729d930392d16104b18d8a0baaa527600e2108470d1e6038233"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.0.5/nomad_1.0.5_linux_arm.zip"
    sha256 "0c5d99e3d604a3653b4c8f792c651de0f31300842d23444b9a9567b8534cca6a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.0.5/nomad_1.0.5_linux_arm64.zip"
    sha256 "e1c891da2615cd3c626fca1161ae2354b69bc7fdf197cfe84550b185169408bf"
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
