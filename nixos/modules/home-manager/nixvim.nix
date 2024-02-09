{ pkgs, nixvim, inputs, ...}: 

{
    programs.nixvim = {
      enable = true;

      colorschemes.tokyonight.enable = true;

      options = {
        number = true;
	relativenumber = true;

        shiftwidth = 2;
      };

      plugins = {
        lualine.enable = true;
        # lightline.enable = true;
        bufferline.enable = true;
      };

      plugins.nvim-cmp = {
        enable = true;
  	autoEnableSources = true;
  	sources = [
    	  {name = "nvim_lsp";}
    	  {name = "path";}
    	  {name = "buffer";}
    	  {name = "luasnip";}
  	];

  	mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
	      function(fallback)
	        if cmp.visible() then
	          cmp.select_next_item()
	      elseif luasnip.expandable() then
	          luasnip.expand()
	      elseif luasnip.expand_or_jumpable() then
	          luasnip.expand_or_jump()
	      elseif check_backspace() then
	          fallback()
	      else
	          fallback()
	      end
	    end
          '';
          modes = [ "i" "s" ];
        };
      };
    };

    plugins.lsp = {
      enable = true;

      servers = {
        tsserver.enable = true;
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
      };
    };

    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>g";
      }
    ];

    highlight = {
      Comment.fg = "#ff00ff";
      Comment.bg = "#000000";
      Comment.underline = true;
      Comment.bold = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        config = "lua require(\"Comment\").setup()";
      }
    ];

    globals.mapleader = " ";

  };
}
