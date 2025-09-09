class Shitpic < Formula
  desc "Recompresses JPEGs to make shitpics"
  homepage "https://github.com/earthboundkid/shitpic"
  url "https://github.com/earthboundkid/shitpic/archive/7f384b26950378e5e2afb21671b06b916c058b23.tar.gz"
  version "1.0-7f384b2"
  sha256 "57761123732909bf0149f0a4cd843f05039d1279669318b254141823bb283c94"
  license "MIT"

  bottle do
    root_url "https://github.com/MagicalDrizzle/homebrew-tap/releases/download/shitpic-1.0-7f384b2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ad55c0327a36916a15457210a8cf9ebafcf26ad2efea8863427d79be486fa630"
    sha256 cellar: :any_skip_relocation, ventura:       "bd3b8678b37ead9c210056b85307db62489318aafc4423014a5a4ddba306a493"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "dd4f53166ec22822c809e4cd0e65ef593de2146ee28e87d0657eb9d8723e0527"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "cmd/shitpic/shitpic.go"
  end

  test do
    cp test_fixtures("test.jpg"), testpath
    assert_match ".....", shell_output("#{bin}/shitpic -cycles 5 #{testpath}/test.jpg #{testpath}/output.jpg 2>&1")
    assert_path_exists testpath/"output.jpg"
  end
end
