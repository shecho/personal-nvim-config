local status_ok, nodeActions = pcall(require, "ts-node-action")
if not status_ok then
	return
end
nodeActions.setup({})
