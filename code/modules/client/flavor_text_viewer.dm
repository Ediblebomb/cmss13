/datum/flavor_text_viewer/ui_data(mob/target)
	. = ..()

	var/datum/preferences/prefs = target.client?.prefs
	if(!prefs)
		return

	.["categories"] = list()

	for (var/category in prefs.flavor_texts)
		.["categories"] += category
		.[category] = prefs.flavor_texts[category]

/datum/flavor_text_viewer/tgui_interact(mob/user, datum/tgui/ui)
	. = ..()

	ui = SStgui.try_update_ui(user, src, ui)

	if(!ui)
		ui = new(user, src, "FlavorTextViewer", "Flavor Text Viewer")
		ui.open()
		ui.set_autoupdate(FALSE)

	winset(user, ui.window.id, "focus=true")

/datum/flavor_text_viewer/ui_state(mob/user)
	return GLOB.always_state
