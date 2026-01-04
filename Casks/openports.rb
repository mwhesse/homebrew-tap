cask "openports" do
  version "1.1.0"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  url "https://github.com/mwhesse/OpenPorts/releases/download/v#{version}/OpenPorts.zip"
  name "OpenPorts"
  desc "Menu bar app for monitoring and managing open TCP ports"
  homepage "https://github.com/mwhesse/OpenPorts"

  depends_on macos: ">= :ventura"

  app "OpenPorts.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/OpenPorts.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.mwhesse.OpenPorts.plist",
  ]
end
