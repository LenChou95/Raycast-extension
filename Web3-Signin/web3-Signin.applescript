#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Web3 签到领水
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🧇

# Documentation:
# @raycast.author Lenchou
# @raycast.authorURL https://raycast.com/Lenchou

log "Hello World! daily"

-- 列出想要打开的网址
set urls to {"https://coinmarketcap.com/account/my-diamonds/","https://www.coingecko.com/account/candy?locale=zh","https://sepoliafaucet.com","https://www.alchemy.com/faucets/arbitrum-sepolia","https://www.alchemy.com/faucets/optimism-sepolia","https://www.alchemy.com/faucets/polygon-amoy","https://www.okx.com/cn/x1/faucet","https://www.alchemy.com/faucets/base-sepolia"}

tell application "Google Chrome"
	activate
	make new window
end tell

repeat with i from 1 to count urls
	if item i of urls starts with "http" then
		tell application "Google Chrome"
			tell window 1
				make new tab with properties {URL:item i of urls}
			end tell
		end tell
	else
		do shell script "open " & quoted form of (item i of urls)
	end if
end repeat

-- 打开 "Roam Research" 应用
tell application "Roam Research"
	activate
end tell