namespace Valadate.Tests {

	public class ConcreteTests : AbstractTests {
	
		construct {
			mysteryanimal = "duck";
		}

		public override void test_get_dog() throws FactoryError {
			
			var dog = factory.get_object("dog");
			
			assert(dog is TestObject);
			assert(dog.name == "dog");
		}

	
	}

}
