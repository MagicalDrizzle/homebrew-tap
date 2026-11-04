class Redu < Formula
  desc "Ncdu for your restic repository"
  homepage "https://github.com/drdo/redu"
  url "https://github.com/drdo/redu.git",
    tag: "v0.2.16",
    revision: "5962f434e748c0a187254d8edd33fd13ce5668ef"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Error: restic error", shell_output("#{bin}/redu --repo mock_repo mock_pw 2>&1", 1)
  end
end
