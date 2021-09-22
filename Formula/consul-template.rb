class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.27.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-template/0.27.1/consul-template_0.27.1_darwin_amd64.zip"
    sha256 "95d832271ba49de4e647cf9bf5cb7de1cf29bfd47be26dba30d456dbda7690af"
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
    url "https://releases.hashicorp.com/consul-template/0.27.1/consul-template_0.27.1_linux_amd64.zip"
    sha256 "db340b7555105d004caf8fad10e1d53ee0bd2320572c4560387279e92490f807"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.27.1/consul-template_0.27.1_linux_arm.zip"
    sha256 "ee6d18c70664dbb0eb3f1061188112aaef7b0cf972e8a409c8209ffd488e8567"
  end

  bottle :unneeded

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
