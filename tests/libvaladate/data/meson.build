sources = files(['testexe.vala',
    'testexetwo.vala'])

testhello = executable('testhello', sources, 
                dependencies: [cli_dep])
test('test hello world', testhello)