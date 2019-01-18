PowerInfusionHandler = BigWigs:NewModule("PowerInfusionHandler", "AceHook-2.1")
PowerInfusionHandler.external = true

function PowerInfusionHandler:CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS(msg)
	if msg == "You gain Power Infusion." then
		PlaySound("LEVELUP")
		self:TriggerEvent("BigWigs_StartBar", self, "Power Infusion", 15, "Interface\\Icons\\Spell_Holy_PowerInfusion", "Yellow")
		self:ScheduleEvent("BigWigs_StartBar", 15, self, "Power Infusion Cooldown", 165, "Interface\\Icons\\Spell_Holy_PowerInfusion", "Yellow")
		self:ScheduleEvent("BigWigs_Message", 180, "Power Infusion Ready!", "Red")
	end
end

function PowerInfusionHandler:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS")
end