-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("n", ";", ":", { desc = "Use ; as :" })
map({ "n", "v" }, "d", '"_d', { desc = "Use d to delete without yanking" })
map({ "n" }, "D", '"_D', { desc = "Use D to delete without yanking" })
map({ "n" }, "x", '"_x', { desc = "Use x to delete without yanking" })
map({ "n" }, "X", '"_X', { desc = "Use x to delete without yanking" })
map({ "n", "v" }, "c", '"_c', { desc = "Use c to delete without yanking" })
map({ "n", "v" }, "C", '"_C', { desc = "Use C to delete without yanking" })
map({ "n", "v" }, ",d", '"+d')
map({ "n", "v" }, ",D", '"+D')
map({ "n", "v" }, ",c", '"+c')
map({ "n", "v" }, ",C", '"+C')
