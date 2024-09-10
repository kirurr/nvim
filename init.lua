if vim.g.vscode then
    require('config.settings')
    require('config.keybindings')
    print("entering vscode")
else
    require('config.settings')
    require('config.keybindings')
    require('config.lazy')
    require('config.lsp')
end
