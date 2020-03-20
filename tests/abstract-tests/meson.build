sources = files(['object-factory.vala',
	'abstract-tests.vala',
	'concrete-tests.vala'])

factories = executable('factories', sources, 
                dependencies: [cli_dep])
test('test factories', factories)