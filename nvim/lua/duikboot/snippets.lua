local snippets = require'snippets'.use_suggested_mappings()
local U = require('snippets.utils')


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

require'snippets'.snippets = {
    _global = {
        todo = note_snippet "TODO";
        note = note_snippet "NOTE";
    };
    python = {
        -- Match the indentation of the current line for newlines.
        ["for"] = U.match_indentation [[
for ${1:i} in ${2:t}:
    $0]];
        ["for-simple"] = U.match_indentation [[
for $1 in $2:
    $3
        ]];
--     NOTE:
--     Find a way to sync arguments and init
--     - Arjen, zo 15 nov 2020 12:05:30 CET
        ["class"] = U.match_indentation [[
class $1:
    def __init__(self, $2):
       $0]];
    };
}
