local snippets = require'snippets'
local U = require('snippets.utils')

snippets.use_suggested_mappings()

snippets.set_ux(require'snippets.inserters.floaty')

local function note_snippet(header)
    -- Put a dummy value for -1 and add a default later.
    local S = [[
    ${-1}:
    $0
    - Arjen, ${=os.date()}]]
    S = U.force_comment(S)
    S = U.match_indentation(S)
    return U.iterate_variables_by_id(S, -1, function(v)
        v.default = header
    end)
end

function complete_arg_list(string)
    local rest_completion = string .. '):\n    '

    for str in string.gmatch(string, "([^"..','.."]+)") do
      rest_completion = rest_completion .. "self." .. str:gsub(" ", "") .. ' = ' .. str:gsub(" ", "") .. '\n    '
    end

    return rest_completion
end

snippets.snippets = {
    _global = {
        todo = note_snippet "TODO";
        note = note_snippet "NOTE";
    };
    python = {
        -- Match the indentation of the current line for newlines.
        ["#!"] = [[#!/usr/bin/env python]],

        ["for"] = U.match_indentation [[
for $1 in $2:
    $3
        ]];

        ["try"] = U.match_indentation [[
try:
    ${1:pass}
except ${2:Exception} as ${3:e}:
    ${4:pass}
        ]];

        ["ifmain"] = U.match_indentation [[
if __name__ == "__main__":
    ${1:main()}]];


        ['init'] = U.match_indentation [[
def __init__(self, ${1|complete_arg_list(S.v)}
]];

    };
    lisp = {
        ['def'] = U.match_indentation [[
(defun $1 ($2)
  ($0))]];
    };

    markdown = {
        ["code"] = U.match_indentation "```\n$0\n```";
    };
}

-- snippets.snippets = {
--     _global = {
--         note = [[NOTE(${1=io.popen("id -un"):read"*l"}): ]];
--         todo = [[TODO(${1=io.popen("id -un"):read"*l"}): ]];
--         fixme = [[FIXME(${1=io.popen("id -un"):read"*l"}): ]];
--     };
-- }
