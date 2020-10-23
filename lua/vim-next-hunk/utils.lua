
local utils = {}

function utils.some(t, pred)
  local iter = getiter(t)
  for k, v in iter(t) do
    if pred(v) then return k end
  end
  return nil
end
