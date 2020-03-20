project('valadate', 'vala', 'c')

add_project_arguments(['--vapidir', join_paths(meson.source_root(), 'vapi'),
		       '--pkg', 'config',
		      ], language: 'vala')

glib_dep = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')
gmodule_dep = dependency('gmodule-2.0')
gio_dep = dependency('gio-2.0')
xml_dep = dependency('libxml-2.0')

vala_version = get_option ('vala-version')
if vala_version == ''
	vc = find_program('valac')
	r = run_command(vc, '--api-version')
	vala_version = r.stdout().strip()
endif
vala_dep_str = 'libvala-@0@'.format (vala_version)
vala_dep = dependency(vala_dep_str)
VAPIDIR = vala_dep.get_pkgconfig_variable ('vapidir')

conf_data = configuration_data()
conf_data.set('VERSION', '2.0.0')
driver_dir = join_paths(meson.build_root(), 'libvaladate', 'drivers')
conf_data.set('VALADATE_DRIVER_DIR', '"@0@"'.format(driver_dir))
configure_file(output : 'config.h',
               configuration : conf_data)

conf_inc_dir = [include_directories('.')]

subdir('libvaladate')
#subdir('tests')
