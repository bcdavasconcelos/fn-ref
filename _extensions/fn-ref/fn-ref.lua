-- Based on https://stackoverflow.com/questions/76030546/how-to-cross-reference-footnotes-and-page-numbers-in-quarto-pdf by Shafayet Khan Shafee
-- See also https://github.com/shafayetShafee/nameref/issues/2

function Span(el)
  local id = el.identifier:gsub("fn%-", "")

  if FORMAT == "latex" then
    table.insert(
      el.content,
      pandoc.RawInline('latex', '\\label{' .. id .. '}')
      )
    return el
  end
  if FORMAT == "HTML" then
    return pandoc.Span(el.content, pandoc.Attr(id))
  end
end

function RawInline(el)
  local fid = el.text:match("\\fnref{(.+)}")
  local ref_text = {
    pandoc.Str('See n.'),
    pandoc.Space(),
    pandoc.RawInline('latex', '\\ref{' .. fid .. '}'),
    pandoc.Str(', p.'),
    pandoc.Space(),
    pandoc.RawInline('latex', '\\pageref{' .. fid .. '}'),
  }
  return ref_text
end

-- Allow @fn-footnote1 instead of \footref{footnote1}
function Str(el)
  local fid = el.text:match("@fn%-([%w%-]+)")

  if fid then
  else
    return
  end

  if FORMAT == "latex" then
  local ref_text = {
    pandoc.Str('n.'),
    pandoc.Space(),
    pandoc.RawInline('latex', '\\ref{' .. fid .. '}'),
    pandoc.Str(' (p.'),
    pandoc.Space(),
    pandoc.RawInline('latex', '\\pageref{' .. fid .. '}'),
    pandoc.Str(')'),
    }
    return ref_text
  end
local link_id = 'fn-' .. fid
local link_str = fid
  if FORMAT == "html" then
    local ref_text = {
      pandoc.Space(),
      pandoc.Link(
        pandoc.Str(link_str),
        '#' .. link_id
      )
    }
    return ref_text
  end
end
