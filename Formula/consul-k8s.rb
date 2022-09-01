class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.48.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.48.0/consul-k8s_0.48.0_darwin_amd64.zip"
    sha256 "3edcfcc7df774820566e910309551efe73538b915b653768f3e3e6eaf96c50b8"
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
    url "https://releases.hashicorp.com/consul-k8s/0.48.0/consul-k8s_0.48.0_linux_amd64.zip"
    sha256 "58bd1115877176d2a87d1e2233b5575774f819e575339f8650a5303b3124d359"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.48.0/consul-k8s_0.48.0_linux_arm.zip"
    sha256 "41e50bf1003ddd05fb773d5ccfe8f2db907c68b7139042ec4ce5dfe55172e62f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.48.0/consul-k8s_0.48.0_linux_arm64.zip"
    sha256 "6fa4c62861df07ac65a5ab4b6cad246b9ec38b7f432875294164579c3ddd66c6"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
