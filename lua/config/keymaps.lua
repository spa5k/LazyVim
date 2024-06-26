-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Delete conflicting keymaps
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<c-_>")

vim.keymap.set("n", "<C-/>", function()
  -- Check if a count is provided
  if vim.v.count > 0 then
    -- If count is provided, use the count mappings
    return vim.v.count .. "<Plug>(comment_toggle_linewise_count)"
  else
    -- No count provided, toggle the current line
    return "<Plug>(comment_toggle_linewise_current)"
  end
end, { expr = true, desc = "Toggle comment on current/multiple lines" })

-- Visual mode keymap
vim.keymap.set("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment on selected text" })

-- f2 to rename the current keyword under the cursor through lsp
vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename the current keyword" })
