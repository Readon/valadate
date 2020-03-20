namespace Valadate.Tests {

	public delegate Type GetType(); 


	public static void new_test_assembly() throws Error {
		
		var assembly = new TestAssembly({ testbinary.get_path() });
		
		assert(assembly is TestAssembly);
	}

	public static void test_assembly_srcdir() throws Error {
		
		var assembly = new TestAssembly({ testbinary.get_path() });
		
		var srcdir = Environment.get_variable("G_TEST_SRCDIR");
		
		assert(assembly.srcdir.get_path() == srcdir);
	}

	public static void test_assembly_builddir() throws Error {
		
		var assembly = new TestAssembly({ testbinary.get_path() });
		
		var builddir = Environment.get_variable("G_TEST_BUILDDIR");
		
		assert(assembly.builddir.get_path() == builddir);
	}

	public static void test_assembly_get_method() throws Error, AssemblyError {
		
		var assembly = new TestAssembly({ testbinary.get_path() });
		var testmethod = "valadate_tests_test_exe_get_type";
		
		var node_type = (GetType)assembly.get_method(testmethod);

		var t = node_type();

		assert(t.is_a(typeof(TestCase)));
	}

	public static void test_assembly_fuzz_method() throws Error {
		
		var assembly = new TestAssembly({ testbinary.get_path() });
		var testmethod = "valadate_tests_test_exe_test_simple";
		
		var node_type = (GetType)assembly.get_method(testmethod);

		var t = node_type();

		assert(t.is_a(typeof(TestCase)));
	}

	public static void test_assembly_fuzz_fail() {
		GLib.Test.trap_subprocess("/testassembly/fuzzmethod/subprocess", 0,0);
		GLib.Test.trap_assert_failed();
	}

}
