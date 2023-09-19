local cmp_status, cybu = pcall(require, "cybu")
if not cmp_status then
	return
end

cybu.setup()
vim.keymap.set("n", "<s-tab>", "<Plug>(CybuPrev)")
-- vim.keymap.set("n", "<s-tab>", "<plug>(CybuLastusedPrev)")
-- vim.keymap.set("n", "<tab>", "<plug>(CybuLastusedNext)")
