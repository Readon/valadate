
lib_sources = files(['src/assembly.vala', 'src/assemblyinfo.vala', 
                        'src/asynctestrunner.vala', 'src/debugger.vala', 'src/driver.vala', 
                        'src/girtestplan.vala', 'src/gnutestreportprinter.vala', 'src/gtestadapter.vala',
                        'src/loadable.vala', 'src/pluginmodule.vala', 'src/serialtestrunner.vala',
                        'src/systemprogram.vala', 'src/taptestreportprinter.vala', 
                        'src/test.vala', 'src/testadapter.vala', 'src/testassembly.vala',
                        'src/testcase.vala', 'src/testconfig.vala', 'src/testerror.vala',
                        #'src/testexplorer.vala', 
                        'src/testfixture.vala', 'src/testoptions.vala',
                        'src/testplan.vala', 'src/testreport.vala', 'src/testreportprinter.vala',
                        'src/testresult.vala', 'src/testrunner.vala', 'src/teststatus.vala', 'src/testsuite.vala',
                        'src/texttestplan.vala', 'src/vapitestplan.vala', 'src/xmltestreportprinter.vala',
                        'utils/xmlfile.vala', 'utils/wait.vala', 'utils/signalwaiter.vala'])

cli_sources = files(['cli/cli-main.vala'])

depends = [glib_dep, gobject_dep, gmodule_dep, gio_dep, xml_dep, vala_dep]
inc_dir = conf_inc_dir + [include_directories('.')]

libvaladate = shared_library('libvaladate', lib_sources,
                                dependencies: depends,
			                    include_directories : inc_dir,
                                install: true)
valadate_dep = declare_dependency(dependencies:depends, link_with: libvaladate, include_directories : inc_dir)

libvaladate_cli = shared_library('libvaladate_cli', cli_sources, 
			                    include_directories : inc_dir,
                                dependencies: depends+[valadate_dep],
                                install: true)

subdir('drivers')
