class Tok < Formula
  desc "Token Optimization Kit - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/MantisWare/tok"
  version "0.1.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/0.1.3/tok-aarch64-apple-darwin.tar.gz"
    sha256 "c684b17ee8afcc5693c73ecd6fb3f366c51944384cacf50a47d1450cddb55b84"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/0.1.3/tok-x86_64-apple-darwin.tar.gz"
    sha256 "e7e82ace5985993b7e803c91315f2a92e969f1ea81ff3976fec072bdc7992e28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/MantisWare/tok/releases/download/0.1.3/tok-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "585f24232743282aa138ccda124c654501f84bd45bd23ecb25039e01c325de60"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/MantisWare/tok/releases/download/0.1.3/tok-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f04ae705411da2fca5dd75eae96b3dbefa14cc348be46dd3561811533da4885b"
  end

  def install
    bin.install "tok"
  end

  def caveats
    <<~EOS

        ████████╗  ██████╗   ██╗  ██╗
        ╚══██╔══╝ ██╔═══██╗  ██║ ██╔╝
 ██║    ██║   ██║  █████╔╝
 ██║    ██║   ██║  ██╔═██╗
 ██║     ╚████╔╝   ██║  ██╗
 ╚═╝      ╚═══╝    ╚═╝  ╚═╝
        tok 0.1.3 — Token Optimization Kit
        Squeeze noisy CLI output before it hits your LLM

      ── Quick Start ─────────────────────────────────────

        # 1. Install for your AI tool
        tok init -g                  # Claude Code (recommended)
        tok init -g --gemini         # Gemini CLI
        tok init -g --codex          # Codex (OpenAI)
        tok init -g --agent cursor   # Cursor

        # 2. Restart your AI tool, then test
        tok --version                # Verify installation
        tok gain                     # View token savings

      ── What It Does ──────────────────────────────────

        tok sits between your shell and your LLM, filtering
        command output for 60-90% token savings:

        tok git status          # Compact status
        tok cargo test          # Failures only (-90%)
        tok ls .                # Token-optimized tree
        tok grep "pattern" .    # Grouped results

      ── Resources ─────────────────────────────────────

        Docs:   https://github.com/MantisWare/tok
        Help:   tok --help
        Issues: https://github.com/MantisWare/tok/issues

    EOS
  end

  test do
    system "#{bin}/tok", "--version"
  end
end
