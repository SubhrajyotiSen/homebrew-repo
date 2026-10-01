class HuamiToken < Formula
  desc "Retrieve Huami and Xiaomi Bluetooth pairing keys"
  homepage "https://github.com/SubhrajyotiSen/huami-token-kmp"
  url "https://github.com/SubhrajyotiSen/huami-token-kmp/releases/download/v1.0.0/cli.zip"
  version "1.0.0"
  sha256 "45498ccab25c9b75406771ea545830264404c673ab1bca6c890f1083b61b0dd0"

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
