// Verb to toggle restart notifications
/client/verb/notify_restart()
	set category = "OOC"
	set name = "Notify Restart"
	set desc = "Notifies you on Discord when the server restarts."

	// Safety checks
	if(!CONFIG_GET(flag/sql_enabled))
		to_chat(src, span_warning("此功能需要SQL后端正在运行。"))
		return

	if(!SSdiscord) // SS is still starting
		to_chat(src, span_notice("服务器仍在启动中。请稍后再尝试链接您的账户。"))
		return

	if(!SSdiscord.enabled)
		to_chat(src, span_warning("此功能需要服务器运行在TGS工具包上"))
		return

	var/stored_id = SSdiscord.lookup_id(usr.ckey)
	if(!stored_id) // Account is not linked
		to_chat(src, span_warning("这需要你使用'关联 Discord 账户'功能来链接你的 Discord 账户。"))
		return

	var/stored_mention = "<@[stored_id]>"
	for(var/member in SSdiscord.notify_members) // If they are in the list, take them out
		if(member == stored_mention)
			SSdiscord.notify_members -= stored_mention 
			to_chat(src, span_notice("服务器重启时将不再通知您"))
			return // This is necassary so it doesnt get added again, as it relies on the for loop being unsuccessful to tell us if they are in the list or not

	// If we got here, they arent in the list. Chuck 'em in!
	to_chat(src, span_notice("服务器重启时您将收到通知"))
	SSdiscord.notify_members += "[stored_mention]" 
