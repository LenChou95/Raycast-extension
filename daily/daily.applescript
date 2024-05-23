#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title 每日灵感
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Lenchou
# @raycast.authorURL https://raycast.com/Lenchou

log "Hello World! daily"

-- 列出想要打开的网址
set urls to {"https://www.wanqu.co/","https://www.reddit.com/r/ChatGPT/","https://www.reddit.com/r/golang/","https://news.ycombinator.com/","https://www.producthunt.com/","https://github.com/trending"}

-- 提示用户选择打开方式
set userChoice to button returned of (display dialog "Choose how to open tabs:" buttons {"New Window", "Current Window"} default button "Current Window")

tell application "Google Chrome"
	activate
	if userChoice is equal to "New Window" then
		make new window
	end if
end tell

repeat with i from 1 to count urls
	if item i of urls starts with "http" then
		tell application "Google Chrome"
			if userChoice is equal to "New Window" then
				tell window 1
					make new tab with properties {URL:item i of urls}
				end tell
			else
				tell front window
					make new tab with properties {URL:item i of urls}
				end tell
			end if
		end tell
	else
		do shell script "open " & quoted form of (item i of urls)
	end if
end repeat

-- 打开 "Roam Research" 应用
tell application "Roam Research"
	activate
end tell