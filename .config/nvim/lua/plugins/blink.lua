return {
  {
    "saghen/blink.cmp",
    ---@class PluginLspOpts
    opts = {
      signature = { enabled = true },
      keymap = {
        preset = "super-tab",
      },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
    },
  },
}
