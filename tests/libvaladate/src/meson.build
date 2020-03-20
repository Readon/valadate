sources = files(['main.vala',
    'mocks.vala', 'assembly.vala', 'asynctestrunner.vala',
    'girtestplan.vala', 'gnutestreportprinter.vala',
    'taptestresultprinter.vala', 'testadapter.vala', 'testassembly.vala',
    'testcase.vala', 'testplan.vala', 'testreport.vala', 'testresult.vala',
    'testsuite.vala', 'vapitestplan.vala', 'xmltestreportprinter.vala'])

testlib = executable('testlib', sources, 
                dependencies: [cli_dep])
test('test valadate library', testlib)