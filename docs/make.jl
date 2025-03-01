using DocInventories
using DocumenterInterLinks: InterLinks
using Documenter

links = InterLinks(
    "Julia" => (
        "https://docs.julialang.org/en/v1/",
        "https://docs.julialang.org/en/v1/objects.inv",
        joinpath(@__DIR__, "src", "inventories", "Julia.toml")
    ),
    "JuliaDocs" => (
        "https://github.com/JuliaDocs/",
        joinpath(@__DIR__, "src", "inventories", "JuliaDocs.toml")
    ),
    "Documenter" => "https://documenter.juliadocs.org/stable/",
    "matplotlib" => "https://matplotlib.org/3.7.3/",
    "sphinx" => "https://www.sphinx-doc.org/en/master/",
    "sphobjinv" => "https://sphobjinv.readthedocs.io/en/stable/",
)

println("Starting makedocs")

PAGES = [
    "Home" => "index.md",
    "Usage" => "usage.md",
    "Inventory File Formats" => "formats.md",
    "Creating Inventory Files" => "creating.md",
    "API" => "api.md",
]

makedocs(
	format    = Documenter.HTML(),
	modules   = [DocInventories],
	pages     = PAGES,
	pagesonly = true,
	plugins   = [links],
	sitename  = "DocInventories.jl",
)

println("Finished makedocs")

deploydocs(
	branch    = "gh-pages",
	devbranch = "master",
	devurl    = "latest",
	forcepush = true,
	repo      = "github.com/Heptazhou/DocInventories.jl.git",
)
