class HuamiToken < Formula
  desc "Retrieve Huami and Xiaomi Bluetooth pairing keys"
  homepage "https://github.com/SubhrajyotiSen/huami-token-kmp"
  url "https://github.com/SubhrajyotiSen/huami-token-kmp/releases/download/v1.0.1/cli.zip"
  version "1.0.1"
  sha256 "7b5412df4c0ab9b19ca45bc9584fdb19dbebec34f6240bf350462c707782661e"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"huami-token").write_env_script libexec/"bin/cli",
      JAVA_HOME: "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/huami-token --help")
    assert_includes output, "Usage:"
  end
end
