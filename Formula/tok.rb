class Tok < Formula
  desc "Token Optimization Kit - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/MantisWare/tok"
  version "0.1.17"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.17/tok-aarch64-apple-darwin.tar.gz"
    sha256 "ad3343a28bd6abb95627381b42b672f5e70e3fe7b0ca32af2e8be8ff5b34500b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.17/tok-x86_64-apple-darwin.tar.gz"
    sha256 "c483323f336b11ba2c96f01791f0b983663ee2f806c4c9925e0b1179946047b8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.17/tok-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c07225622456afbf25a847cf8f4f7d1b3ff8415b38d3d841525ecc8b7ab94d62"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/v0.1.17/tok-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ebe04d71100325d70ec71180b7e968c8f9ec1dadc7737e02c7b7a0c644d353b7"
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

    tok 0.1.17 — Token Optimization Kit
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
