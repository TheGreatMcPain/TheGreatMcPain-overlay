project('ReShade FX', ['cpp'], default_options : ['cpp_std=c++2a'], version : '4.5.3', meson_version : '>= 0.43')

sources = [
  'source/effect_codegen_glsl.cpp',
  'source/effect_codegen_hlsl.cpp',
  'source/effect_codegen_spirv.cpp',
  'source/effect_expression.cpp',
  'source/effect_lexer.cpp',
  'source/effect_parser.cpp',
  'source/effect_preprocessor.cpp',
  'source/effect_symbol_table.cpp',
]

headers = [
  'source/effect_codegen.hpp',
  'source/effect_expression.hpp',
  'source/effect_lexer.hpp',
  'source/effect_module.hpp',
  'source/effect_parser.hpp',
  'source/effect_preprocessor.hpp',
  'source/effect_symbol_table.hpp',
  'source/effect_token.hpp',
]

# Static lib
static_library('reshade-fx', sources, include_directories: [ '/usr/include/spirv/unified1' ], install: true)

# Headers
install_headers(headers, subdir : 'reshade')
