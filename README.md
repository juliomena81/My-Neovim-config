# Neovim

Configuración personal para Neovim 0.11+ sobre [lazy.nvim](https://github.com/folke/lazy.nvim). Pensada para desarrollo web (Astro, Svelte, Tailwind), Python y shell.

## Requisitos

- Neovim 0.11 o superior
- `git`, `node`/`npm`, `python3`
- Nerd Font instalada (iconos de neo-tree, lualine, alpha)
- En el `PATH`: `stylua`, `shfmt`, `black`, `isort`, `pylint`, `shellcheck`, `hadolint`, `prettier`

## Estructura

```
init.lua                líder, setup básico, keymaps, lazy
lua/usr/
├── lazy.lua            bootstrap de lazy.nvim e imports
├── core/
│   ├── setup.lua       opciones, filetypes, PATH, indentación
│   └── keymaps.lua     atajos generales, git, test, dap
└── plugins/
    ├── core/           lsp, cmp, luasnip, treesitter, conform, lint
    ├── ui/             colorscheme, lualine, alpha, snacks, trouble, which-key
    ├── git/            gitsigns, diffview
    ├── testing/        neotest, nvim-dap
    ├── navigation/     neo-tree, fzf-lua, harpoon
    ├── web/            emmet, surround, autotag, colorizer
    ├── utils/          toggleterm, markdown-preview
    └── extras/         avante
```

## Primer arranque

1. `git clone <repo> ~/.config/nvim`
2. Abrir `nvim`: lazy.nvim se instala solo y descarga los plugins.
3. `:Mason` para revisar servidores LSP.
4. `:checkhealth` para comprobar dependencias.

## Plugins

| Área | Plugins |
|---|---|
| Gestor | lazy.nvim |
| Colores | nightfox (`terafox` activo) |
| Interfaz | lualine, alpha-nvim, which-key, snacks.nvim, trouble |
| Navegación | neo-tree, fzf-lua, harpoon |
| LSP | mason, mason-lspconfig, nvim-lspconfig, nvim-cmp, LuaSnip |
| Formato/lint | conform.nvim, nvim-lint |
| Sintaxis | nvim-treesitter (master), ts-autotag, colorizer |
| Git | gitsigns, diffview |
| Tests | neotest (python, jest/vitest) |
| Debug | nvim-dap, nvim-dap-ui, mason-nvim-dap |
| Web | emmet-vim, nvim-surround, tailwindcss-colorizer-cmp |
| Utilidades | toggleterm, markdown-preview |
| IA | avante.nvim (DeepSeek) |

## Atajos

Líder: `Espacio`.

### Generales

| Atajo | Acción |
|---|---|
| `jj` (insertar) | Salir a modo normal |
| `<leader>nh` | Limpiar resaltado de búsqueda |
| `J` / `K` (visual) | Mover la selección abajo / arriba |

### Archivos y búsqueda

| Atajo | Acción |
|---|---|
| `<leader>e` | Abrir/cerrar neo-tree |
| `<leader>ff` | Buscar archivos |
| `<leader>fg` | Buscar texto en el proyecto (live grep) |
| `<leader>fb` | Buffers abiertos |
| `<leader>a` | Harpoon: marcar archivo |
| `<leader>h` | Harpoon: menú de marcados |
| `<leader>1` / `<leader>2` | Ir al marcado 1 / 2 |

Dentro del buscador (fzf-lua): `Ctrl-s` split, `Ctrl-v` vsplit, `Ctrl-t` pestaña, `F1` ayuda, `F2` pantalla completa, `F3` ajuste de preview, `F4` mostrar/ocultar preview, `Alt-a` seleccionar todo.

Dentro de neo-tree: `l` abrir, `h` cerrar nodo.

### LSP

Servidores: `lua_ls`, `pyright`, `bashls`, `dockerls`, `html`, `cssls`, `tailwindcss`, `astro`, `svelte`.

| Atajo | Acción |
|---|---|
| `gd` | Ir a la definición |
| `K` | Documentación del símbolo |
| `<leader>rn` | Renombrar símbolo |
| `<leader>ca` | Acciones de código |

### Formato

| Atajo | Acción |
|---|---|
| guardar | Formatea automáticamente (conform) |

| Tipo | Formateador |
|---|---|
| lua | stylua (2 espacios) |
| python | isort + black (4 espacios) |
| sh | shfmt (4 espacios) |
| html, css, astro, svelte, js, ts, json, yaml | prettier |

Lint al escribir: `pylint` (python), `shellcheck` (sh), `hadolint` (dockerfile).

### Git

| Atajo | Acción |
|---|---|
| `<leader>gp` / `<leader>gn` | Hunk anterior / siguiente |
| `<leader>gl` | Blame de la línea |
| `<leader>gd` | Abrir Diffview |
| `<leader>gq` | Cerrar Diffview |

### Tests y depuración

| Atajo | Acción |
|---|---|
| `<leader>tt` | Ejecutar el test más cercano |
| `<leader>tf` | Ejecutar el archivo de tests |
| `<leader>to` | Ver salida del test |
| `<leader>db` | Poner/quitar breakpoint |
| `<leader>dc` | Continuar |
| `<leader>di` | Entrar en la función |
| `<leader>do` | Pasar por encima |

Adaptadores de test: `neotest-python` y `neotest-jest` (sirve también para Vitest). Depuración de Python vía `debugpy` del entorno `~/.local/share/nvim/py-tools`.

### IA (avante)

| Atajo | Acción |
|---|---|
| `<leader>cq` | Preguntar |
| `<leader>ce` (visual) | Editar la selección |
| `<leader>cf` | Añadir archivo al chat (dentro de neo-tree) |

Proveedor y modelo se editan en `lua/usr/plugins/extras/avante.lua`. La API key se lee del entorno (`DEEPSEEK_API_KEY`); no se guarda en la configuración.

### Terminal y otros

| Atajo | Acción |
|---|---|
| `<F12>` | Abrir/cerrar terminal flotante |
| `<Esc>` (terminal) | Salir del modo terminal |
| `Ctrl-h/j/k/l` (terminal) | Moverse entre ventanas |
| `<leader>mp` | Vista previa de Markdown |
| `Ctrl-Espacio` | Selección incremental (treesitter) |
| `Ctrl-s` / `Alt-Espacio` | Ampliar / reducir selección |

Autocompletado (cmp): `Ctrl-j` / `Ctrl-k` siguiente/anterior, `Ctrl-Espacio` completar, `Enter` confirmar, `Tab` expandir o saltar snippet.

## Personalización

- Opciones e indentación: `lua/usr/core/setup.lua`
- Atajos: `lua/usr/core/keymaps.lua`
- LSP: `lua/usr/plugins/core/lsp.lua`
- Formateo y lint: `lua/usr/plugins/core/format.lua`, `lua/usr/plugins/core/lint.lua`
- Grupos del menú de which-key: `lua/usr/plugins/ui/whichkey.lua`

## Notas del equipo

- Las herramientas de formato y lint están instaladas en `~/.local/bin`; `setup.lua` añade esa ruta al `PATH` de Neovim.
- Shell y Python usan 4 espacios; el resto, 2.
- El colorscheme activo es `terafox` (nightfox). catppuccin y tokyonight están instalados pero no se aplican.
- El registro por defecto de Mason no resuelve en este equipo: los servidores que ya están instalados siguen funcionando, pero `:MasonInstall` puede no encontrar paquetes.
