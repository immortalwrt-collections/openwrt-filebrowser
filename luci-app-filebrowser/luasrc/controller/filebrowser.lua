module("luci.controller.filebrowser", package.seeall)
--local fs=require"nixio.fs"
--local http=require"luci.http"
--local uci=require"luci.model.uci".cursor()

function index()
	if not nixio.fs.access("/etc/config/filebrowser") then
		return
	end
	entry({"admin", "nas"}, firstchild(), _("NAS") , 44).dependent = false
	local page
	page = entry({"admin", "nas", "filebrowser"}, cbi("filebrowser"), _("File Browser"), 100).dependent = true
	entry({"admin","nas","filebrowser","status"},call("act_status")).leaf=true
end

function act_status()
	local e={}
	e.running=luci.sys.call("pgrep filebrowser >/dev/null")==0
	-- e.port=luci.sys.exec("uci get filebrowser.config.port")
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end
