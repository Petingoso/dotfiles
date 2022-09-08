local home = os.getenv('HOME')
local status_ok, db = pcall(require, "dashboard")
if not status_ok then
     return
end


db.preview_command = 'cat | lolcat -F 0.3'
db.preview_file_path = home .. '/.config/nvim/static/nvim.cat'
db.preview_file_height = 20
db.preview_file_width = 55
  db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                ',
      shortcut = 'Ç s l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'Ç f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'Ç f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'Ç f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'Ç f w'},
         }
