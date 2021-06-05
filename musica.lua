--Musica by pjals
local speakers = {peripheral.find("speaker")}
local file = fs.open(arg[1], "r")
local data = textutils.unserialiseJSON(file.readAll())
file.close()

if not data.info then
    error("No song info.")
end

if not data.song then
    error("Seriously? Theres not even a song.")
end

for index in pairs(data.song) do
    sleep(1/data.info.tempo)
    for _,speaker in pairs(speakers) do
        print(textutils.serialise(data.song[index]))
        speaker.playNote(data.song[index][1], --instrument
            data.song[index][2], --volume
            data.song[index][3]) --pitch
    end
end
    
