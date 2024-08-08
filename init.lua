if vim.g.vscode then
    require('config.settings')
    print("entering vscode")
else
    require('config.settings')
    require('config.lazy')
    require('config.lsp')
end
