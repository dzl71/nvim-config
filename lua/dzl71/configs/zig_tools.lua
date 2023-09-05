return {
  --- Commands to interact with your project compilation
  expose_commands = true,
  --- Format source code
  formatter = {
    --- Enable formatting, create commands
    enable = true,
    --- Events to run formatter, empty to disable
    events = {},
  },
  --- Check for compilation-time errors
  checker = {
    --- Enable checker, create commands
    enable = true,
    --- Run before trying to compile?
    before_compilation = true,
    --- Events to run checker
    events = {},
  },
  --- zig-tools.nvim integrations
  integrations = {
    --- Zig Language Server
    zls = {
      --- Enable inlay hints
      hints = true,
      --- Manage installation
      management = {
        --- Enable ZLS management
        enable = false,
        --- Installation path
        install_path = os.getenv("HOME") .. "/.local/bin",
        --- Source path (where to clone repository when building from source)
        source_path = os.getenv("HOME") .. "/.local/zig/zls",
      },
    },
  }
}
