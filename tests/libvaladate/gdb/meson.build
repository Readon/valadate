sources = files(['tests/gdb-test-base.vala',
    'tests/test-object.vala'])

gdbtest = executable('gdbtest', sources, 
                dependencies: [cli_dep])
test('test gdb', gdbtest)

sources = files(['test-runner.vala'])

gdbtestrunner = executable('gdbtestrunner', sources, 
                dependencies: [cli_dep])
test('test gdb runner', gdbtestrunner)