# -*- coding: utf-8 -*-
require 'dbus'

bus = DBus::SessionBus.instance

mikutter_service = bus.service("org.mikutter.dynamic")
client_to_mikutter = mikutter_service.object("/org/mikutter/MyInstance")
client_to_mikutter.introspect
eval_ruby = client_to_mikutter["org.mikutter.eval"]
puts ARGV[0]
eval_ruby.ruby([["code", ARGV[0]],["file", ""]])
#eval_ruby.ruby([["code", "Plugin.call(:update, nil, [Message.new(:message => \"D-Busから投稿\", :system => true)])"],["file", ""]])
#eval_ruby.ruby([["code", "Plugin.uninstall(:urlsave)"],["file", ""]])
