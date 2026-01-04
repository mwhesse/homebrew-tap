cask "openports" do
  version "1.3.0"
  sha256 "b21dc65daa0811d9356f45164afb95ccb2c742f80e6b368d2b2dac3a0671c979"

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
