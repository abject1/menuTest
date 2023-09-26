fx_version 'cerulean'
games { 'gta5' };

name 'NativeUILua-Reloaded'

client_scripts {
    "src/Wrapper/*.lua",
    "src/UIElements/*.lua",
    "src/UIMenu/elements/*.lua",
    "src/UIMenu/items/*.lua",
    "src/UIMenu/windows/*.lua",
    "src/UIMenu/panels/*.lua",
    "src/UIMenu/*.lua",
    'src/UITimerBar/*.lua',
    'src/UITimerBar/items/*.lua',
    'src/UIProgressBar/*.lua',
    'src/UIProgressBar/items/*.lua',
    "src/NativeUI.lua",
    "src/NativeUIReloaded.lua",
}

--------------------------------------

client_scripts {
    'main.lua',
}
