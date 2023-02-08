require "lib.moonloader"
require "vkeys"
local sf = require "lib.sampfuncs"
local events = require("samp.events")
local config = require 'inicfg'
local cfg = config.load(nil, 'alina_tools/config.ini')
local prizivi, minute, hour, predmin, predmin1, predmin2, predmin3, minute1, minute2, minute3 = "config/alina_tools/config.ini"
local settings = {}
local text1 = '"Los-Santos"'
local text2 = '"San-Fierro"'
local text3 = '"Las-Venturas"'
local text4 = '"Нарколога"'
local dlstatus = require("moonloader").download_status
local script_vers = 1
local script_path = thisScript().path
local script_url = "https://raw.githubusercontent.com/Vladik1234/obnovlenie/master/alina_tools.lua"
local update_path = getWorkingDirectory() .. "/update.ini"
local update_url = "https://raw.githubusercontent.com/Vladik1234/florenso/main/update.ini"

local LVDialog = {}


function main()
  while not isSampAvailable() do wait(100) end
  if cfg == nil then
    local settings = {
      global = {
        prizivi = false,
      }
    }
    config.save(settings, 'alina_tools/config.ini')
  else
    prizivi = cfg.global.prizivi
    hour = cfg.global.hour
    minute = cfg.global.minute
    minute1 = cfg.global.minute1
    minute2 = cfg.global.minute2
    minute3 = cfg.global.minute3
    predmin = cfg.global.predmin
    predmin1 = cfg.global.predmin1
    predmin2 = cfg.global.predmin2
    predmin3 = cfg.global.predmin3
    settings = cfg
  end

  lua_thread.create(function()
    downloadUrlToFile(update_url, update_path, function(id, status)
      if status == dlstatus.STATUS_ENDDOWNLOADDATA then
          updateIni = config.load(nil, update_path)
          if tonumber(updateIni.info.vers) > script_vers then
              update_state = true
          end
      end
    end)
  end)

  lua_thread.create(function()
    while true do wait(0)
      local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
      local name = sampGetPlayerNickname(id):gsub("_", " ")
      if cfg.global.prizivi ~= nil then
        if cfg.global.prizivi == true then
          local timestamp = os.time() 
          local dt1 = os.date( "!*t", timestamp )
          local dt2 = os.date( "*t" , timestamp ) 
          local shift_h  = dt2.hour - dt1.hour +  (dt1.isdst and 1 or 0)
          local shift_m = 100 * (dt2.min  - dt1.min) / 60
          if tonumber(os.date("%H")) == cfg.global.hour and tonumber(os.date("%M")) == cfg.global.predmin and tonumber(os.date("%S")) == 00 then
            wait(500)
            sampAddChatMessage(os.date("[alina tools]: Через минуту вещаем, не уходи в афк."), 0x33AAFFFF)
          end
          if tonumber(os.date("%H")) == cfg.global.hour and tonumber(os.date("%M")) == cfg.global.minute and tonumber(os.date("%S")) == 00 then
            sampAddChatMessage(os.date("[alina tools]: Начинаю вещание. Не пользуйся чатом."), 0x33AAFFFF) 
            wait(500)
            sampSendChat(" /d OG, занимаю волну государственных новостей.")
            wait(2500)
            sampSendChat(" /gov [Medic]: Дорогие гости, а также жители штата — Началось собеседование в Больницу Los-Santos")
            wait(5500)
            sampSendChat(" /gov [Medic]: Требования: проживание в штате от 3-х лет, адекватность и наличие медицинского диплома.")
            wait(5500)
            sampSendChat(" /gov [Medic]: Всех кандидатов мы ждём в Больнице г.Los-Santos на втором этаже. Код GPS: 4-7.")
            wait(2500)
            sampSendChat(" /d OG, освободил(а) волну государственных новостей.")
            wait(1000)
            justPressThisShitPlease(VK_F6)
            sampSetChatInputText("/pagesize 20")
            justPressThisShitPlease(VK_RETURN)
            wait(500)
            sampSendChat("/time 1")
            wait(500)
            justPressThisShitPlease(VK_F8)
            wait(500)
            justPressThisShitPlease(VK_F6)
            sampSetChatInputText("/pagesize 11")
            justPressThisShitPlease(VK_RETURN)
          end
          if tonumber(os.date("%M")) == cfg.global.predmin1 and tonumber(os.date("%S")) == 00 then
            wait(500)
            sampAddChatMessage(os.date("[alina tools]: Через минуту вещаем, не уходи в афк."), 0x33AAFFFF)
          end
          if tonumber(os.date("%M")) == cfg.global.minute1 and tonumber(os.date("%S")) == 00 then
            sampAddChatMessage(os.date("[alina tools]: Начинаю вещание. Не пользуйся чатом."), 0x33AAFFFF)
            wait(500)
            sampSendChat(" /d OG, занимаю волну государственных новостей.")
            wait(2500)
            sampSendChat(" /gov [Medic]: Дорогие гости, а также жители штата — проходит приём в интернатуру Минздрава.")
            wait(5500)
            sampSendChat(" /gov [Medic]: Требования: проживание в штате от 3-х лет, адекватность и наличие медицинского диплома.")
            wait(5500)
            sampSendChat(" /gov [Medic]: Всех кандидатов мы ждём в Больнице г.Los-Santos на втором этаже. Код GPS: 4-7.")
            wait(2500)
            sampSendChat(" /d OG, освободил(а) волну государственных новостей.")
            wait(1000)
            justPressThisShitPlease(VK_F6)
            sampSetChatInputText("/pagesize 20")
            justPressThisShitPlease(VK_RETURN)
            wait(500)
            sampSendChat("/time 1")
            wait(500)
            justPressThisShitPlease(VK_F8)
            wait(500)
            justPressThisShitPlease(VK_F6)
            sampSetChatInputText("/pagesize 11")
            justPressThisShitPlease(VK_RETURN)
          end
          if tonumber(os.date("%M")) == cfg.global.predmin2 and tonumber(os.date("%S")) == 00 then
            wait(500)
            sampAddChatMessage(os.date("[alina tools]: Через минуту вещаем, не уходи в афк."), 0x33AAFFFF)
          end
          if tonumber(os.date("%M")) == cfg.global.minute2 and tonumber(os.date("%S")) == 00 then
            sampAddChatMessage(os.date("[alina tools]: Начинаю вещание. Не пользуйся чатом."), 0x33AAFFFF)
            wait(500)
            sampSendChat(" /d OG, занимаю волну государственных новостей.")
            wait(2500)
            sampSendChat(" /gov [Medic]: Дорогие гости, а также жители штата — проходит приём в интернатуру Минздрава.")
            wait(5500)
            sampSendChat(" /gov [Medic]: Требования: проживание в штате от 3-х лет, адекватность и наличие медицинского диплома.")
            wait(5500)
            sampSendChat(" /gov [Medic]: Всех кандидатов мы ждём в Больнице г.Los-Santos на втором этаже. Код GPS: 4-7.")
            wait(2500)
            sampSendChat(" /d OG, освободил(а) волну государственных новостей.")
            wait(1000)
            justPressThisShitPlease(VK_F6)
            sampSetChatInputText("/pagesize 20")
            justPressThisShitPlease(VK_RETURN)
            wait(500)
            sampSendChat("/time 1")
            wait(500)
            justPressThisShitPlease(VK_F8)
            wait(500)
            justPressThisShitPlease(VK_F6)
            sampSetChatInputText("/pagesize 11")
            justPressThisShitPlease(VK_RETURN)
          end
          if tonumber(os.date("%M")) == cfg.global.predmin3 and tonumber(os.date("%S")) == 00 then
            wait(500)
            sampAddChatMessage(os.date("[alina tools]: Через минуту вещаем, не уходи в афк."), 0x33AAFFFF)
          end
          if tonumber(os.date("%M")) == cfg.global.myminute3 and tonumber(os.date("%S")) == 00 then
            sampAddChatMessage(os.date("[alina tools]: Начинаю вещание. Не пользуйся чатом."), 0x33AAFFFF)
            wait(500)
            sampSendChat(" /d OG, занимаю волну государственных новостей.")
            wait(2500)
            sampSendChat(" /gov [Medic]: Дорогие гости, а также жители штата — К сожалению собеседование подошло к концу.")
            wait(5500)
            sampSendChat(" /gov [Medic]: Напоминаю что на офф. портале Мин. Здрава, открыли заявление на должность "..text4..".")
            wait(5500)
            sampSendChat(" /gov [Medic]: Всех желающих мы ждём в Больнице г.Los-Santos на втором этаже. Код GPS: 4-7.")
            wait(2500)
            sampSendChat(" /d OG, освободил(а) волну государственных новостей.")
            wait(1000)
            justPressThisShitPlease(VK_F6)
            sampSetChatInputText("/pagesize 20")
            justPressThisShitPlease(VK_RETURN)
            wait(500)
            sampSendChat("/time 1")
            wait(500)
            justPressThisShitPlease(VK_F8)
            wait(500)
            justPressThisShitPlease(VK_F6)
            sampSetChatInputText("/pagesize 11")
            justPressThisShitPlease(VK_RETURN)
            cfg.global.prizivi = false
            sampAddChatMessage("[alina tools]: Режим вещания отключён. Если вы будете проводить следующее собеседование - включите режим ещё раз, предварительно установив время.", 0x33AAFFFF) 
            wait(1000)
            thisScript():reload()
          end
        end
      end
    end
  end)

  while true do wait(0)
    if testCheat("KJK") then
      submenus_show(LVDialog, "{00FA9A}alina tools{FFFFFF}")
    end
    if update_state then
      downloadUrlToFile(script_url, script_path, function(id, status)
          if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            thisScript():reload()
          end
      end)
    end
    kalkulator()
    refreshDialog()
  end

end

function refreshDialog()
  LVDialog = {

    {
      title = "{808080}Собеседование{FFFFFF}",
      submenu = {
        title = "{808080}Настройки{FFFFFF}",
        {
          title = "{808080}Установить время вещания{FFFFFF}",
          onclick = function()
            sampShowDialog(1234, "{CD5C5C}alina tools{FFFFFF}", "{b6b6b6}Установите время начала вещания.\n\nОбразец: {FFFFFF}12:00", "ОК", "Закрыть", 1)
            while sampIsDialogActive() do wait(0) end
            local result, button, item, input = sampHasDialogRespond(1234)
            if result and button == 1 then
              local args = split(input, ":")
                cfg.global.hour = args[1]
                cfg.global.minute = args[2]
                cfg.global.minute1 = cfg.global.minute + 10
                cfg.global.minute2 = cfg.global.minute1 + 10
                cfg.global.minute3 = cfg.global.minute2 + 10
                cfg.global.predmin = cfg.global.minute - 1
                cfg.global.predmin1 = cfg.global.minute1 - 1
                cfg.global.predmin2 = cfg.global.minute2 - 1
                cfg.global.predmin3 = cfg.global.minute3 - 1
                sampAddChatMessage("[alina tools]: Вы назначили вещание на "..cfg.global.hour..":"..cfg.global.minute..". Чтобы провещать в это время предварительно включите режим вещания.", 0x33AAFFFF)
                wait(1000)
                sampAddChatMessage("[alina tools]: Рекомендуется включать режим вещания в момент, когда до него более 2-х минут.", 0x33AAFFFF)
                thisScript():reload()
            end
          end
        },
        {
          title = "{808080}Режим вещания",
          onclick = function()
            if cfg.global.prizivi == true then 
              cfg.global.prizivi = false 
              sampAddChatMessage("[alina tools]: Режим вещания выключен.", 0x33AAFFFF)
            else
              cfg.global.prizivi = true 
              sampAddChatMessage("[alina tools]: Режим вещания включен.", 0x33AAFFFF)
              wait(1000)
              sampAddChatMessage("[alina tools]: Вещание начнётся в "..hour..":"..minute..".", 0x33AAFFFF)
              wait(500)
              thisScript():reload()
            end
          end
        },
      }
    },
  }
end

function split(inputstr, sep) 
  if sep == nil then 
    sep = "%s" 
  end 
  local t = {} ; i = 1 
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do 
    t[i] = str i = i + 1 
  end 
  return t 
end

function justPressThisShitPlease(key) 
  lua_thread.create(function(key) 
    setVirtualKeyDown(key, true) 
    wait(10) 
    setVirtualKeyDown(key, false) end, key) 
end

function events.onServerMessage(color, text)
  if (text:find("Добро пожаловать на Evolve Role Play")) then
    if cfg.global.prizivi == true then
      cfg.global.prizivi = false
      sampAddChatMessage("[alina tools]: Режим вещания отключён. Если вы будете проводить следующее собеседование - включите его ещё раз, предварительно установив время.", 0x33AAFFFF)
    end 
  end
end

function submenus_show(menu, caption, select_button, close_button, back_button)
  select_button, close_button, back_button = select_button or 'Выбрать', close_button or 'Выйти', back_button or 'Назад'
  prev_menus = {}
  function display(menu, id, caption)
    local string_list = {}
    for i, v in ipairs(menu) do
      table.insert(string_list, type(v.submenu) == 'table' and v.title or v.title)
    end
    sampShowDialog(id, caption, table.concat(string_list, '\n'), select_button, (#prev_menus > 0) and back_button or close_button, sf.DIALOG_STYLE_LIST)
    repeat
      wait(0)
      local result, button, list = sampHasDialogRespond(id)
      if result then
        if button == 1 and list ~= -1 then
          local item = menu[list + 1]
          if type(item.submenu) == 'table' then -- submenu
            table.insert(prev_menus, {menu = menu, caption = caption})
            if type(item.onclick) == 'function' then
              item.onclick(menu, list + 1, item.submenu)
            end
            return display(item.submenu, id + 1, item.submenu.title and item.submenu.title or item.title)
          elseif type(item.onclick) == 'function' then
            local result = item.onclick(menu, list + 1)
            if not result then return result end
            return display(menu, id, caption)
          end
        else -- if button == 0
          if #prev_menus > 0 then
            local prev_menu = prev_menus[#prev_menus]
            prev_menus[#prev_menus] = nil
            return display(prev_menu.menu, id - 1, prev_menu.caption)
          end
          return false
        end
      end
    until result
  end
  return display(menu, 31337, caption or menu.title)
end

function kalkulator()
  if cfg.global.minute1 == 60 then
    cfg.global.minute1 = 00
  end
  if cfg.global.minute1 == 65 then
    cfg.global.minute1 = 05
  end
  if cfg.global.minute2 == 60 then
    cfg.global.minute2 = 00
  end
  if cfg.global.minute2 == 65 then
    cfg.global.minute2 = 05
  end
  if cfg.global.minute2 == 70 then
    cfg.global.minute2 = 10
  end
  if cfg.global.minute2 == 75 then
    cfg.global.minute2 = 15
  end
  if cfg.global.minute3 == 60 then
    cfg.global.minute3 = 00
  end
  if cfg.global.minute3 == 65 then
    cfg.global.minute3 = 05
  end
  if cfg.global.minute3 == 70 then
    cfg.global.minute3 = 10
  end
  if cfg.global.minute3 == 75 then
    cfg.global.minute3 = 15
  end
  if cfg.global.minute3 == 80 then
    cfg.global.minute3 = 20
  end
  if cfg.global.minute3 == 85 then
    cfg.global.minute3 = 25
  end
  if cfg.global.predmin1 == 64 then
    cfg.global.predmin1 = 04
  end
  if cfg.global.predmin2 == 64 then
    cfg.global.predmin2 = 04
  end
  if cfg.global.predmin2 == 69 then
    cfg.global.predmin2 = 09
  end
  if cfg.global.predmin2 == 74 then
    cfg.global.predmin2 = 14
  end
  if cfg.global.predmin3 == 64 then
    cfg.global.predmin3 = 04
  end
  if cfg.global.predmin3 == 69 then
    cfg.global.predmin3 = 09
  end
  if cfg.global.predmin3 == 74 then
    cfg.global.predmin3 = 14
  end
  if cfg.global.predmin3 == 79 then
    cfg.global.predmin3 = 19
  end
  if cfg.global.predmin3 == 84 then
    cfg.global.predmin3 = 24
  end
end

function writeInFile(path, message)
  local file = io.open(path, 'a')
  if (file == nil) then
    file = io.open(path, 'w')
  end
  file:write(message.."\n")
  file:close()
end

function onScriptTerminate(script)
  if (script == thisScript()) then
    config.save(settings, "alina_tools/config.ini")
  end
end