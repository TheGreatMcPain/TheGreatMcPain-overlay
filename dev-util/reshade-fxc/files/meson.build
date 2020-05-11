project('ReShade FX compiler', ['cpp'], default_options : ['cpp_std=c++2a'], version : '4.6.1', meson_version : '>= 0.43')

# Binary
executable('reshade-fxc', 'tools/fxc.cpp',
  dependencies: [ declare_dependency(link_args: [ '-lreshade-fx' ]) ],
  include_directories: [ '/usr/include/reshade' ],
  install: true)

# https://github.com/DadSchoorse/ReshadeFxCompiler/pull/1
executable('reshade-fx2conf', 'tools/fx2conf.cpp',
  dependencies: [ declare_dependency(link_args: [ '-lreshade-fx' ]) ],
  include_directories: [ '/usr/include/reshade' ],
  install: true)
