sources = files(['wait.vala',
    'testsignalwaiter.vala'])

testutils = executable('testutils', sources, 
                dependencies: [cli_dep])
test('test utils tool', testutils)