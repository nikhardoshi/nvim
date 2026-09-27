local dap = require "dap"

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"

-- Python
dap.adapters.python = {
  type = "executable",
  command = mason_bin .. "/debugpy-adapter",
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch current file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.exepath("python3")
    end,
  },
}

-- Go
dap.adapters.go = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_bin .. "/dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

dap.configurations.go = {
  {
    type = "go",
    name = "Debug current file",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug package",
    request = "launch",
    program = "${fileDirname}",
  },
}

-- C / C++
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_bin .. "/codelldb",
    args = { "--port", "${port}" },
  },
}

local cpp_configurations = {
  {
    name = "Launch executable",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = cpp_configurations
dap.configurations.cpp = cpp_configurations

-- JavaScript / TypeScript
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = mason_bin .. "/js-debug-adapter",
    args = { "${port}" },
  },
}

local js_configurations = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch current file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.javascript = js_configurations
dap.configurations.javascriptreact = js_configurations
dap.configurations.typescript = js_configurations
dap.configurations.typescriptreact = js_configurations
