return function(c, hl)
  hl["LazyButton"] = { bg = c.float_bg_select }
  hl["LazyH2"] = { link = "FloatTitle" }
  hl["LazyButtonActive"] = { link = "Search" }
  hl["LazyCommit"] = { link = "" }
  hl["LazyCommitType"] = { link = "@markup.heading.gitcommit" }
  hl["LazyCommitIssue"] = { link = "Number" }
  hl["LazyProgressDone"] = { link = "LazyComment" }
  hl["LazyProgressTodo"] = { link = "FloatBorder" }
  hl["LazyReasonCmd"] = { link = "Comment" }
  hl["LazyReasonColorscheme"] = { link = "Comment" }
  hl["LazyReasonEvent"] = { link = "Comment" }
  hl["LazyReasonFt"] = { link = "Comment" }
  hl["LazyReasonPlugin"] = { link = "Comment" }
  hl["LazyReasonRequire"] = { link = "Comment" }
  hl["LazyReasonSource"] = { link = "Comment" }
  hl["LazyReasonStart"] = { link = "Comment" }
  hl["LazySpecial"] = { link = "Comment" }
end
