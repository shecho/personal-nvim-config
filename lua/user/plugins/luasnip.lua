local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local d = luasnip.dynamic_node
local sn = luasnip.snippet_node

luasnip.add_snippets("all", {
	s("ternary", {
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else"),
	}),
	s("aaa", { t("console.log("), i(1, ""), t(")") }),
	s("rc", {
		t("export type "),
		i(1),
		t("Props = {}"),
		t({ "", "export function " }),
		d(2, function(args)
			-- the returned snippetNode doesn't need a position; it's inserted
			-- "inside" the dynamicNode.
			return sn(nil, {
				-- jump-indices are local to each snippetNode, so restart at 1.
				i(1, args[1]),
			})
		end, { 1 }),
		t("(){return null}"),
	}),
})
