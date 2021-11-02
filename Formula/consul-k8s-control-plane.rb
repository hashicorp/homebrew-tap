class ConsulK8sControlPlane < Formula
    desc "Consul K8s Control Plane"
    homepage "https://github.com/hashicorp/consul-k8s"
    version "0.35.0"
  
    if OS.mac?
      url "https://releases.hashicorp.com/consul-k8s-control-plane/0.35.0/consul-k8s-control-plane_0.35.0_darwin_amd64.zip"
      sha256 "c2ee6264035a106f8dabfb98f1d73cb3ac2d9e6180b9fe87eca62983e584dd3d"
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
      url "https://releases.hashicorp.com/consul-k8s-control-plane/0.35.0/consul-k8s-control-plane_0.35.0_linux_amd64.zip"
      sha256 "4d61226a3a52d4a40f1f2b944bcd62c591cd0b0f846b88754afc87fc20715502"
    enda
  
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/consul-k8s-control-plane/0.35.0/consul-k8s-control-plane_0.35.0_linux_arm64.zip"
      sha256 "476a042766d042170cb964d40c237160367fab1328a5d93fbc496c7d244cb0d6"
    end
  
    conflicts_with "consul-k8s-control-plane"
  
    def install
      bin.install "consul-k8s-control-plane"
    end
  
    test do
      system "#{bin}/consul-k8s-control-plane --version"
    end
  end
  