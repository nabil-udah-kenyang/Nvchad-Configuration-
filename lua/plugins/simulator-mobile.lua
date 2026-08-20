return {
  {
    "nabil-udah-kenyang/simulator-mobile.nvim",
    cmd = { "SimulatorMobile", "MobileSimulator" },
    config = function()
      require("simulator-mobile").setup()
    end,
  },
}
