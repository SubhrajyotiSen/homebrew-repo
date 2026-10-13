class HuamiToken < Formula
  desc "Retrieve Huami and Xiaomi Bluetooth pairing keys"
  homepage "https://github.com/SubhrajyotiSen/huami-token-kmp"
  url "https://github.com/SubhrajyotiSen/huami-token-kmp/releases/download/v1.0.3/cli-1.0.3.zip"
  version "1.0.3"
  sha256 "00d5802ee51d3c602bdc16b2ac1af5c782f85185653c71e942ea52cc8d4738e4"

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
