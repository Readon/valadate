sources = files(['testpie.vala'])

testpie = executable('testpie', sources, 
                dependencies: [cli_dep])
test('test pie', testpie)

sources = files(['testloadpie.vala'])

testloadpie = executable('testloadpie', sources, 
                dependencies: [cli_dep])
test('test load pie', testloadpie)