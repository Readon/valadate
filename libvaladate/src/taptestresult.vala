/*
 * Valadate - Unit testing library for GObject-based libraries.
 * Copyright (C) 2017  Chris Daley <chebizarro@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Authors:
 * 	Chris Daley <chebizarro@gmail.com>
 */
namespace Valadate { 

	public class TapTestResult : Object, TestResult {

		public int testcount {get;internal set;default=0;}
		public TestConfig config {get;construct set;}

		private Queue<TestReport> reports = new Queue<TestReport>();
		private HashTable<Test, TestReport> tests = new HashTable<Test, TestReport>(direct_hash, direct_equal);
	
		private int testno = 0;

		public bool report() {
			if (reports.is_empty())
				return false;
			
			var rpt = reports.peek_head();

			if (rpt.status == TestStatus.PASSED ||
				rpt.status == TestStatus.SKIPPED ||
				rpt.status == TestStatus.STATUS ||
				rpt.status == TestStatus.FAILED ||
				rpt.status == TestStatus.ERROR) {
				if (rpt.message != null)
					stdout.puts(rpt.message);
				stdout.flush();
				rpt.report(rpt.status);
				reports.pop_head();
				return report();
			}
			return true;
		}

		private void count_tests(Test test) {
			if(test is TestSuite)
				foreach(var subtest in test)
					count_tests(subtest);
			else
				testcount += test.count;
		}
		
		public void start(Test test) {
			count_tests(test);
			reports.push_tail(new TestReport(test, TestStatus.STATUS,-1,
				"# random seed: %s\n1..%d\n".printf(config.seed, testcount)));
		}

		public void add_error(Test test, string error) {
			update_test(test, TestStatus.ERROR,
				"# %s\nnot ok %s %s\n".printf(error, "%d", test.label));
		}

		public void add_failure(Test test, string failure) {
			update_test(test, TestStatus.FAILED,
				"# %s\nnot ok %s %s\n".printf(failure, "%d", test.label));
		}

		public void add_success(Test test, string message) {
			update_test(test, TestStatus.PASSED,
				"# %s\nok %s %s\n".printf(message, "%d", test.label));
		}
		
		public void add_skip(Test test, string reason, string message) {
			update_test(test, TestStatus.SKIPPED,
				"# %s\nok %s %s # %s\n".printf(message, "%d", test.label, reason));
		}

		public void add_test(Test test) {
			reports.push_tail(new TestReport(test, TestStatus.RUNNING, ++testno));
			tests.insert(test, reports.peek_tail());
		}

		public void add_test_start(Test test) {
			reports.push_tail(new TestReport(test, TestStatus.STATUS,-1,
				"# Start of %s tests\n".printf(test.label)));
		}

		public void add_test_end(Test test) {
			reports.push_tail(new TestReport(test, TestStatus.STATUS,-1,
				"# End of %s tests\n".printf(test.label)));
		}

		private void update_test(Test test, TestStatus status, string message) {
			var rept = tests.get(test);
			rept.status = status;
			rept.message = message.printf(rept.index);
		}
		
	}
}