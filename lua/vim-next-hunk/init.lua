local _0_0 = nil
do
  local name_0_ = "vim-next-hunk.main"
  local loaded_0_ = package.loaded[name_0_]
  local module_0_ = nil
  if ("table" == type(loaded_0_)) then
    module_0_ = loaded_0_
  else
    module_0_ = {}
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = (module_0_["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = (module_0_["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local function _2_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {require("vim-next-hunk.aniseed.core"), require("vim-next-hunk.fun"), require("vim-next-hunk.lume"), require("vim-next-hunk.aniseed.nvim"), require("vim-next-hunk.utils")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {a = "vim-next-hunk.aniseed.core", fun = "vim-next-hunk.fun", lume = "vim-next-hunk.lume", nvim = "vim-next-hunk.aniseed.nvim", utils = "vim-next-hunk.utils"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _1_ = _2_(...)
local a = _1_[1]
local fun = _1_[2]
local lume = _1_[3]
local nvim = _1_[4]
local utils = _1_[5]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "vim-next-hunk.main"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
local get_hunks = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function get_hunks0(file)
      local result = {}
      for start, _end in string.gmatch(nvim.fn.system(("git diff --no-ext-diff --no-color -U0 -- " .. file)), "@@%s*[-]%d*,?[^ ]*%s*[+](%d*),?([^ ]*)%s*@@") do
        if ((start ~= "") and (_end ~= "")) then
          lume.push(result, {tonumber(start), tonumber(_end)})
        elseif (start ~= "") then
          lume.push(result, {tonumber(start), tonumber(start)})
        end
      end
      return result
    end
    v_0_0 = get_hunks0
    _0_0["get-hunks"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["get-hunks"] = v_0_
  get_hunks = v_0_
end
local get_changed_file = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function get_changed_file0(file, compare)
      local repo_file_name = nvim.fn.system(("git ls-files --full-name -- " .. file))
      if (repo_file_name ~= "") then
        for _, f in pairs(lume.split(nvim.fn.system("git ls-files --full-name -m"), "\n")) do
        end
        return nil
      end
    end
    v_0_0 = get_changed_file0
    _0_0["get-changed-file"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["get-changed-file"] = v_0_
  get_changed_file = v_0_
end
-- (lume.map (lume.split (nvim.fn.system git ls-files --full-name -m)  ) (fn table: 0x402a75e8 (< x a))) (get-next-changed-file Makefile) (< .gitignore script) (get-hunks (nvim.fn.expand %:p)) (get-hunks Makefile)
return nil