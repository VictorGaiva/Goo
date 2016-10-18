require("config")

function ReplaceSpawnerWith(Source, Target)
  -- Salve original values
  local SrcPos    = Source.position
  local SrcHealth = Source.health
  local SrcDir    = Source.direction
  local SrcSurf   = Source.surface
  -- Destroy original entity
  Source.destroy()

  -- Create a new target entity in the position
  NewEnt = SrcSurf.create_entity{name=Target, position=SrcPos, direction=SrcDir}

  -- Set the new entity health
  NewEnt.health = SrcHealth + 100

end

script.on_event(defines.events.on_entity_died, function(event)
  local EntPos  = event.entity.position
  local EntName = event.entity.name
  local EntSurf = event.entity.surface
  -- If it is a spitter-spawner
  if EntName == "spitter-spawner" then
    -- 1 Destroy each fire
    -- 1.1 find each fire
    FireEnt = EntSurf.find_entities_filtered{area = { {EntPos.x - 5, EntPos.y - 5}, {EntPos.x + 5, EntPos.y + 5} }, type="fire"}

    -- 1.2 and destroy it
    for key, value in pairs(FireEnt) do
      value.destroy()
    end

    -- 2 Replace the spawners with goo-spawners
    -- 2.1 Find spawners in area
    Spawners = EntSurf.find_entities_filtered{area = { {EntPos.x - 5, EntPos.y - 5}, {EntPos.x + 5, EntPos.y + 5} }, name= "spitter-spawner"}

    -- 2.2 Replace them with goo-spitter-spawner
    for key, value in pairs(Spawners) do
      if value ~= event.entity then
        ReplaceSpawnerWith(value, "goo-spitter-spawner")
      end
    end
  end
end)
