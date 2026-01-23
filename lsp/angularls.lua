local project_library_path = function()
  local root = vim.fs.root(0, { "angular.json", "nx.json", "package.json" })
  return root .. "/node_modules"
end

return {
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations", project_library_path(),
    "--ngProbeLocations", project_library_path(),
  },
  filetypes = { "typescript", "html", "typescript.tsx" },
  root_dir = vim.fs.root(0, { "angular.json", "nx.json" }),
}
