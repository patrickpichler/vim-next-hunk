local _0_0 = nil
do
  local name_0_ = "vim-next-hunk.aniseed.fennel"
  local loaded_0_ = package.loaded[name_0_]
  local module_0_ = nil
  if ("table" == type(loaded_0_)) then
    module_0_ = loaded_0_
  else
    module_0_ = require("vim-next-hunk.aniseed.deps.fennel")
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
    return {require("vim-next-hunk.aniseed.deps.fennel"), require("vim-next-hunk.aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {require = {fennel = "vim-next-hunk.aniseed.deps.fennel", nvim = "vim-next-hunk.aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _1_ = _2_(...)
local fennel = _1_[1]
local nvim = _1_[2]
local _2amodule_2a = _0_0
local _2amodule_name_2a = "vim-next-hunk.aniseed.fennel"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
nvim.ex.let("&runtimepath = &runtimepath")
fennel["path"] = string.gsub(string.gsub(string.gsub(package.path, "/lua/", "/fnl/"), ".lua;", ".fnl;"), ".lua$", ".fnl")
return nil
