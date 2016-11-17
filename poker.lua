do
 
 function run(msg, matches)
   if is_sudo(msg) then
   if msg.text:match("^[!/#]([Pp][Oo][Kk][Ee][Rr]) ([Oo][Nn])$") then
       redis:set("poker:send", "on")
       return "Poker = on"
   elseif msg.text:match("^[!/#]([Pp][Oo][Kk][Ee][Rr]) ([Oo][Ff][Ff])$") then
       redis:set("poker:send", "off")
       return "Poker = off"
   end
  end
   
     if msg.text:match("😐") then
         if redis:get("poker:send") == "on" then
            reply = msg['id']
            txt = "😐"
            reply_msg(reply, txt, ok_cb, false)
         elseif redis:get("poker:send") == "off" then
            return
        end
     end
 end
 return {
     advan = {
       "Created by @janlou",
       "Powered by @AdvanTm",
       "CopyRight all right reserved",
     },
     patterns = {
        "^[!/#]([Pp][Oo][Kk][Ee][Rr]) ([Oo][Nn])$",
        "^[!/#]([Pp][Oo][Kk][Ee][Rr]) ([Oo][Ff][Ff])$",
        "😐"
     },
  run = run
 }
 
end
