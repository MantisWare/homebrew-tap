class MiaCli < Formula
  desc "Terminal interface to miaOS"
  homepage "https://github.com/MantisWare/mia-cli"
  url "git@github.com:MantisWare/mia-cli.git", tag: "v0.8.0"
  version "0.8.0"
  license :cannot_represent

  depends_on "node"

  def install
    system "npm", "ci"
    system "npm", "run", "build"
    system "npm", "prune", "--omit=dev"
    libexec.install "dist", "node_modules", "package.json"
    (bin/"mia").write_env_script libexec/"dist/launcher.js", {}
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mia --version")
  end
end
