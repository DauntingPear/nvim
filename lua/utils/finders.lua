local M = {}

function M.find_dotfiles()
    require("telescope.builtin").find_files {
        prompt_title = "<Dotfiles>",
        cwd = "~/.config/nvim",
    }
end

function M.find_nvim_cfg()
    require("telescope.builtin").find_files {
        prompt_title = "<Dotfiles>",
        cwd = "~/.config/nvim",
    }
end

function M.find_workspace(prompt_bufnr)
    local selection = require("telescope.actions.state").get_selected_entry()
    local dir = vim.fn.fnamemodify(selection.path, ":p:h")
    require("telescope.actions").close(prompt_bufnr)
    vim.cmd(string.format("silent lcd %s", dir))
end

function M.find_files_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end

return M
