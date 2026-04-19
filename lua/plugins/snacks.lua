local day = [[
                                                        
                                                        
                                                        
                   |\      _,,,---,,_                   
            z     / ,`.-'`'   -.  ;-,'-,,_              
              zz  |,4-  ) )-,_. ´\ (  `'-,##>           
                 ' --''(_/--'  `-'\_)                   ]]

local night = [[. ⭑  ⋆     .  ⭑        .    ✦     .     ⭑ +     ⋆  +  .
       ✦       ⭑ ' +    ⋆            .      .  ⭑     
   ⭑.        ⭑ '  .           '   +              .⋆   '
   .     .             ✦        '      ⭑ '        .    
       ⭑   Z      |\      _,,,---,,_          ⭑        
  +         Z    / ,`.-'`'   -.  ;-,',,_             ⋆
             Zz  |,4-  ) )-,_. ´\ (  `'-,##>           
                ' --''(_/--'  `-'\_)                   ]]


local current_hour = tonumber(os.date '%H')
local is_night = current_hour < 8 or current_hour > 19
local banner = is_night and night or day

local format = '%d/%m %H:%M'
local now = os.time()

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = banner .. "\n\n" .. "BER: " .. os.date(format) .. "\n" .. "SFO: " .. os.date(format, now - 9 * 60 * 60)
      }
    },
  }
}
