class Tok < Formula
  desc "Token Optimization Kit - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/MantisWare/tok"
  version "0.1.16"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.16/tok-aarch64-apple-darwin.tar.gz"
    sha256 "0ab1001d2415824622ff64973449e75f34fb57c1833305aa0b2897a4ba84e4bc"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.16/tok-x86_64-apple-darwin.tar.gz"
    sha256 "fd3caa5302cb6f08e7f21266f9e4925727ed5e7ea305a2093730873bb636f1f5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.16/tok-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f2f2c634e133385b389f2a1b3d50b22f80c532ae8b9f18b55aaaccd0ad81e504"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.16/tok-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6ef5408eacab54bc00eb55b76eebb44f67b2b432750a53e0d489369c2c567755"
  end

  def install
    bin.install "tok"
  end

  def caveats; <<~CAVEATS

      ████████╗  ██████╗   ██╗  ██╗
      ╚══██╔══╝ ██╔═══██╗  ██║ ██╔╝
         ██║    ██║   ██║  █████╔╝
         ██║    ██║   ██║  ██╔═██╗
         ██║     ╚████╔╝   ██║  ██╗
         ╚═╝      ╚═══╝    ╚═╝  ╚═╝

    tok 0.1.16 — Token Optimization Kit
    Squeeze noisy CLI output before it hits your LLM

  ── Quick Start ─────────────────────────────────────────

    # 1. Install for your AI tool
    tok init -g                  # Claude Code (recommended)
    tok init -g --gemini         # Gemini CLI
    tok init -g --codex          # Codex (OpenAI)
    tok init -g --agent cursor   # Cursor

    # 2. Restart your AI tool, then test
    tok --version                # Verify installation
    tok gain                     # View token savings

  ── What It Does ────────────────────────────────────────

    tok sits between your shell and your LLM, filtering
    command output for 60-90% token savings:

    tok git status          # Compact status
    tok cargo test          # Failures only (-90%)
    tok ls .                # Token-optimized tree
    tok grep "pattern" .    # Grouped results

  ── Resources ───────────────────────────────────────────

    Docs:   https://github.com/MantisWare/tok
    Help:   tok --help
    Issues: https://github.com/MantisWare/tok/issues

  CAVEATS
  end

  test do
    system "#{bin}/tok", "--version"
  end
end
