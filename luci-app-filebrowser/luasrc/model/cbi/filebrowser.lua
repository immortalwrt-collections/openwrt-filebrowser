--[[

Copyright (C) 2021 guyezi <admin@guyezi.com>
Copyright (C) 2020 [CTCGFW] Project OpenWRT

THIS IS FREE SOFTWARE, LICENSED UNDER GPLv3

]]--

m = Map("filebrowser"
m.title	= translate("File Browser")
m.description = translate("File browser is a private cloud file manager based on go compiler, which makes it easy for you to manage files on your device."))

m:section(SimpleSection).template  = "filebrowser/filebrowser_status"

s = m:section(TypedSection, "filebrowser")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enabled", translate("Enable"))
enable.rmempty = false

o = s:option(ListValue, "addr_type", translate("Listening Address"))
o:value("local", translate("local"))
o:value("lan", translate("Lan"))
o:value("wan", translate("Wan"))
o.default = "lan"
o.rmempty = false

o = s:option(Value, "port", translate("Browser Management Port"))
o.placeholder = 8989
o.default     = 8989
o.datatype    = "port"
o.rmempty     = false

o = s:option(Value, "root_dir", translate("Open Directory"))
o.placeholder = "/"
o.default     = "/"
o.rmempty     = false
o.description = translate("The default value is the root directory.")

o = s:option(Value, "db_dir", translate("Database Directory"))
o.placeholder = "/etc"
o.default     = "/etc"
o.rmempty     = false
o.description = translate("Ordinary users are not allowed to change at will.")

o = s:option(Value, "db_name", translate("Database Name"))
o.placeholder = "filebrowser.db"
o.default     = "filebrowser.db"
o.rmempty     = false
o.description = translate("Ordinary users are not allowed to change at will.")

return m
